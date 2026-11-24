CC = gcc
FLEX = flex
BISON = bison

TARGET = superanandlang

all: $(TARGET)

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d parser.y

lex.yy.c: lexical.l parser.tab.h
	$(FLEX) lexical.l

$(TARGET): parser.tab.c lex.yy.c
	$(CC) parser.tab.c lex.yy.c -o $(TARGET)

run: $(TARGET)
	./$(TARGET) test.sa

clean:
	rm -f $(TARGET) parser.tab.c parser.tab.h lex.yy.c

.PHONY: all run clean
