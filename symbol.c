#include "symbol.h"
#include <string.h>
#include <stdio.h>

Symbol table[200];

int n = 0;

int search(char key[]){
    for(int i = 0; i < n; i++){
        if(strcmp(table[i].id,key) == 0)
            return i;
    }
    return -1;
}

void insert(char name[], int val){

    int index = search(name);

    if(index != -1){
        table[index].value = val;
        return;
    }

    if(n >= 200){
        printf("Symbol table full!\n");
        return;
    }

    strcpy(table[n].id, name);
    table[n].value = val;
    n++;
}