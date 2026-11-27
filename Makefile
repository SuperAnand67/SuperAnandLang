CC = gcc
FLEX = flex
BISON = bison

TARGET = superanandlang

TEST_FILE ?= test.sal

.SILENT:

all: $(TARGET)

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d parser.y

lex.yy.c: lexical.l parser.tab.h
	$(FLEX) lexical.l

$(TARGET): parser.tab.c lex.yy.c symbol.c symbol.h
	$(CC) parser.tab.c lex.yy.c symbol.c -o $(TARGET)
	echo "Build Successfully !"

run: $(TARGET)
	./$(TARGET) $(TEST_FILE)

clean:
	rm -f $(TARGET) parser.tab.c parser.tab.h lex.yy.c
	echo "Cleaned Successfully !"

.PHONY: all run clean
