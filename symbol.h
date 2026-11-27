#ifndef SYMBOL_H
#define SYMBOL_H

typedef struct{
    char id[50];
    int value;
    int initialized;
}Symbol;

extern Symbol table[200];
extern int n;

#endif