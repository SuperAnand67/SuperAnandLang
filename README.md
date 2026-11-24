# SuperAnandLang

A small experimental programming language built using **C, Flex, and Bison**.

SuperAnandLang is a learning-oriented compiler project designed to explore the fundamentals of programming language implementation, lexical analysis, parsing, grammar design, and expression evaluation.

The project currently supports arithmetic expressions, string output, comments, and basic error handling.

## ✨ Features

- **Custom keywords:** Uses `whatis` as an output statement.
- **Arithmetic operations:** Supports addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- **Operator precedence:** Multiplication and division are evaluated before addition and subtraction.
- **Parentheses:** Supports grouped arithmetic expressions.
- **String output:** Allows printing string literals.
- **Escape sequences:** Supports `\n`, `\t`, `\"`, and `\\` in strings.
- **Comments:** Supports single-line and multiline comments enclosed by `$`.
- **Error handling:** Detects invalid characters and division by zero.
- **Build automation:** Uses a Makefile to simplify compilation and execution.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| C | Implementation language |
| Flex | Lexical analysis |
| Bison | Syntax analysis and parsing |
| GCC | Compilation |
| GNU Make | Build automation |

## 📁 Project Structure

```text
SuperAnandLang/
│
├── Makefile          # Automates the build process
├── README.md         # Project documentation
├── lexical.l         # Flex lexer used by the parser
├── parser.y          # Bison grammar and expression evaluation
├── scanner.l         # Standalone lexical scanner experiment
├── test.sa           # Test program
├── sample.sa         # Experimental language syntax
├── input.txt         # Additional sample input
└── .gitignore        # Excludes generated build files
```

**Note:** `scanner.l` is a separate lexical scanner experiment. The current parser uses `lexical.l`.

## ⚙️ Installation

### Prerequisites

Make sure the following tools are installed:

- GCC
- Flex
- Bison
- GNU Make

On Ubuntu, Debian, or Linux Mint:

```bash
sudo apt update
sudo apt install gcc flex bison make
```

## 🚀 Building the Project

Clone the repository:

```bash
git clone https://github.com/SuperAnand67/SuperAnandLang.git
```

Navigate into the project directory:

```bash
cd SuperAnandLang
```

Build the project:

```bash
make
```

That's it! The executable `superanandlang` will be generated.

### Manual Compilation

The project can also be compiled without Make:

```bash
bison -d parser.y
flex lexical.l
gcc parser.tab.c lex.yy.c -o superanandlang
```

## 🔧 Makefile Commands

The project includes a Makefile to automate compilation and execution.

| Command | Description |
|---|---|
| `make` | Builds the executable |
| `make all` | Performs the default build |
| `make run` | Builds and executes `test.sa` |
| `make clean` | Removes generated files and executable |

### Examples

Build the project:

```bash
make
```

Build and run the test program:

```bash
make run
```

Remove generated files:

```bash
make clean
```

Run a custom source file:

```bash
./superanandlang your_file.sa
```

Run interactively through standard input:

```bash
./superanandlang
```

The Makefile also uses file dependencies to avoid unnecessary recompilation when the source files have not changed.

## 📝 Language Syntax

SuperAnandLang currently uses a simple syntax.

### 1. Output a number

```text
whatis 293;
```

Output:

```text
293
```

### 2. Arithmetic expressions

```text
whatis 7 + 8;
whatis 10 * 5;
whatis (10 + 5) * 2;
whatis 100 / 4;
```

Output:

```text
15
50
30
25
```

### 3. String output

```text
whatis "HelloWorld!";
whatis "SuperAnandLang";
```

Output:

```text
HelloWorld!
SuperAnandLang
```

### 4. Escape sequences

```text
whatis "Hello\nWorld!";
whatis "Hello\tWorld!";
```

### 5. Comments

Comments are enclosed within `$` symbols.

Single-line comment:

```text
$ This is a comment $
whatis 10 + 20;
```

Multiline comment:

```text
$
This is a multiline comment.
It can span multiple lines.
$

whatis 100;
```

## 🧠 How It Works

SuperAnandLang follows a basic compiler front-end workflow:

```text
       Source Code (.sa)
               |
               v
       Lexical Analysis
            (Flex)
               |
               v
          Tokens
               |
               v
        Syntax Analysis
            (Bison)
               |
               v
      Expression Evaluation
               |
               v
          Output
```

### Lexical Analysis

The Flex lexer (`lexical.l`) reads the source code and identifies tokens such as:

- Keywords
- Numbers
- Strings
- Arithmetic operators
- Parentheses
- Semicolons

### Syntax Analysis

The Bison parser (`parser.y`) checks whether the token sequence follows the language grammar.

It also evaluates supported arithmetic expressions and handles output statements.

### Execution

The current implementation directly evaluates supported expressions and prints their results. It is not yet a complete compiler that generates machine code or an intermediate representation.

## ⚠️ Current Limitations

SuperAnandLang is an experimental project, and several language features are still under development.

Currently, the parser does not implement:

- Variable declarations and assignments.
- User input.
- Conditional statements.
- Loops.
- Functions.
- Comparison and logical operators.
- Intermediate code generation.

Some experimental syntax may appear in `sample.sa`, but it should not be considered implemented functionality.

## 🔮 Future Improvements

Potential additions include:

- Variable declaration and assignment.
- User input using a custom keyword.
- Conditional statements (`if`, `else`).
- Looping constructs.
- Comparison and logical operators.
- Symbol table implementation.
- Improved syntax and semantic error reporting.
- Intermediate code generation.
- More advanced data types.

## 🎯 Learning Objectives

This project explores practical concepts in:

- Compiler construction.
- Lexical analysis and tokenization.
- Context-free grammars.
- Parsing and syntax validation.
- Operator precedence and associativity.
- Expression evaluation.
- Build automation using GNU Make.

## 👨‍💻 Author

**Anand**

Computer Science and Engineering Student

GitHub: [@SuperAnand67](https://github.com/SuperAnand67)

---

*SuperAnandLang — Exploring the foundations of programming languages, one token at a time.*
