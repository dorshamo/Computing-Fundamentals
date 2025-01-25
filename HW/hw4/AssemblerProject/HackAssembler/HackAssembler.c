//assembler_modified5.c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "Parser.h"
#include "Code.h"
#include "SymbolTable.h"

int isdigit(char c)//returns 1 if c is a digit otherwise 0
{
    return (c >= '0' && c <= '9');  
}

int main(int argc, char* argv[]) 
{
        //Opens the input file, and gets ready to process it
        const char* assemblyFilename;
        if (argc < 2) {
            fprintf(stderr, "Assembly filename is ../file.asm\n");
            assemblyFilename = "../file.asm";
        }
        else
            assemblyFilename = argv[1];
        if (!parser_init(assemblyFilename)) {
            fprintf(stderr, "Usage: assembler filename (default ../file.asm)\n");
            perror("fopen");
            exit(0);
        }

        //set the symbol table
        symbolTable_addEntry("R0", 0);
        symbolTable_addEntry("R1", 1);
        symbolTable_addEntry("R2", 2);
        symbolTable_addEntry("R3", 3);
        symbolTable_addEntry("R4", 4);
        symbolTable_addEntry("R5", 5);
        symbolTable_addEntry("R6", 6);
        symbolTable_addEntry("R7", 7);
        symbolTable_addEntry("R8", 8);
        symbolTable_addEntry("R9", 9);
        symbolTable_addEntry("R10", 10);
        symbolTable_addEntry("R11", 11);
        symbolTable_addEntry("R12", 12);
        symbolTable_addEntry("R13", 13);
        symbolTable_addEntry("R14", 14);
        symbolTable_addEntry("R15", 15);
        symbolTable_addEntry("SCREEN", 16384);
        symbolTable_addEntry("KBD", 24576);
        symbolTable_addEntry("SP", 0);
        symbolTable_addEntry("LCL", 1);
        symbolTable_addEntry("ARG", 2);
        symbolTable_addEntry("THIS", 3);
        symbolTable_addEntry("THAT", 4);
         
        char line[LINE_MAX_SIZE];
        char symbol[LINE_MAX_SIZE];
        char addressStr[LINE_MAX_SIZE];
        char dest[LINE_MAX_SIZE];
        char comp[LINE_MAX_SIZE];
        char jump[LINE_MAX_SIZE];
        int line_Count = 0;
        while (parser_parseNextLine(line)) {//first read

            if (parser_instructionType() == L_INSTRUCTION) {
                parser_symbol(symbol);
                symbolTable_addEntry(symbol, line_Count);
            }
            else if (parser_instructionType() == A_INSTRUCTION) {
                line_Count++;
            }
            else if (parser_instructionType() == C_INSTRUCTION) {
                line_Count++;
            }
        }
        parser_rewind();

        char hackFilename[100];
        strcpy(hackFilename, assemblyFilename);
        char* dotPosition = strrchr(hackFilename, '.');
        if (dotPosition != NULL) {
            strcpy(dotPosition + 1, "hack");
        }
        FILE* hackFP = fopen(hackFilename, "wt");
        if (hackFP == NULL) {
            perror("fopen");
            exit(0);
        }

        char binaryString[17];
        int symbol_Table_Count = 16;
        int found;
        char destBinaryStr[20];
        char compBinaryStr[20];
        char jumpBinaryStr[20];
        while (parser_parseNextLine(line)) {  //secound read
            if (parser_instructionType() == A_INSTRUCTION) {
                parser_address(addressStr);
                found = symbolTable_getAddress(addressStr);
                if (isdigit(addressStr[0]))
                {
                    code_convertIntToBinString(atoi(addressStr), binaryString);
                    fprintf(hackFP, "%s\n", binaryString);
                }
                else if (found != -1)
                {
                    code_convertIntToBinString(found, binaryString);
                    fprintf(hackFP, "%s\n", binaryString);
                }
                else
                {
                    symbolTable_addEntry(addressStr, symbol_Table_Count);
                    code_convertIntToBinString(symbol_Table_Count, binaryString);
                    fprintf(hackFP, "%s\n", binaryString);
                    symbol_Table_Count++;
                }
            }
            else if (parser_instructionType() == C_INSTRUCTION) {
                parser_dest(dest);
                parser_comp(comp);
                parser_jump(jump);
                code_dest(dest, destBinaryStr);
                code_comp(comp, compBinaryStr);
                code_jump(jump, jumpBinaryStr);
                binaryString[15] = jumpBinaryStr[2];
                binaryString[14] = jumpBinaryStr[1];
                binaryString[13] = jumpBinaryStr[0];
                binaryString[12] = destBinaryStr[2];
                binaryString[11] = destBinaryStr[1];
                binaryString[10] = destBinaryStr[0];
                binaryString[9] = compBinaryStr[6];
                binaryString[8] = compBinaryStr[5];
                binaryString[7] = compBinaryStr[4];
                binaryString[6] = compBinaryStr[3];
                binaryString[5] = compBinaryStr[2];
                binaryString[4] = compBinaryStr[1];
                binaryString[3] = compBinaryStr[0];
                binaryString[2] = '1';
                binaryString[1] = '1';
                binaryString[0] = '1';
                fprintf(hackFP, "%s\n", binaryString);
            }
        }
        fclose(hackFP);
}
