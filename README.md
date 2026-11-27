
# SuperAnandLang

A small experimental programming language built using **C, Flex, and Bison**.

SuperAnandLang is a personal language-design project focused on understanding how programming languages work internally — from lexical analysis and grammar design to parsing, semantic actions, and execution.

The project is being developed incrementally, with an emphasis on learning compiler construction through practical implementation rather than simply studying its theory.

---

## Features

### Language Syntax
- `.sal` source file extension.
- `whatis` statement for displaying output.
- `believe` keyword for integer variable declarations.
- `exit()` statement for terminating execution.
- Single-line comments using `$$`.
- Multiline comments using `$ ... $`.

### Variables and Operations
- Integer variable declarations.
- Variable assignment and reassignment.
- Symbol table for storing and retrieving variables.
- Arithmetic operations:
  - Addition (`+`)
  - Subtraction (`-`)
  - Multiplication (`*`)
  - Division (`/`)
- Parentheses and arithmetic precedence.
- Compound assignment operators:
  - `+=`
  - `-=`
  - `*=`
  - `/=`
- Postfix increment (`++`) and decrement (`--`).

### Strings
- String literals using double quotes.
- String concatenation.
- Concatenation of strings with integer expressions (currently limited).
- Escape sequences:
  - `\n` — Newline
  - `\t` — Tab
  - `\"` — Double quote
  - `\\` — Backslash

### Error Handling
- Undefined variable detection.
- Duplicate declaration detection.
- Division-by-zero handling.
- Invalid character detection.
- Syntax error reporting.

---

## Example Program

```sal
$$ Variable declarations
believe age = 19;
believe score = 100;

$$ Arithmetic operations
believe result = (score + 50) * 2;

$$ Compound assignments
score += 25;
age++;

$$ Output
whatis "SuperAnandLang";
whatis "Age: " + age;
whatis "Score: " + score;
whatis "Result: " + result;

exit();
```

---

## Technologies Used

| Technology | Purpose |
|---|---|
| C | Implementation and semantic actions |
| Flex | Lexical analysis |
| Bison | Grammar definition and parsing |
| Make | Build automation |
| TextMate Grammar | VS Code syntax highlighting |

---

## Project Architecture

```text
         Source Code (.sal)
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
          Semantic Actions
                 |
                 v
          Symbol Table
                 |
                 v
             Execution
```

The lexer identifies tokens, the parser validates the grammar, and semantic actions perform operations and manage program execution.

---

## Installation and Usage

### Requirements

- GCC
- Flex
- Bison
- Make

### Clone the Repository

```bash
git clone https://github.com/SuperAnand67/SuperAnandLang.git

cd SuperAnandLang
```

### Build

```bash
make
```

### Run

```bash
make run
```

### Run a Specific File

```bash
make run TEST_FILE=example.sal
```

### Clean Generated Files

```bash
make clean
```

---

## VS Code Support

SuperAnandLang includes a VS Code language extension for `.sal` files.

Current editor support includes:
- Syntax highlighting.
- Language configuration.
- Comment support.
- Bracket configuration.

The extension can be packaged as a VSIX file and installed through VS Code's **Install from VSIX** option.

---

## Project Structure

```text
SuperAnandLang/
|
|-- lexical.l
|-- parser.y
|-- Makefile
|-- test.sal
|-- README.md
|-- LICENSE
|
|-- vscode-extension/
    |-- package.json
    |-- syntaxes/
    |-- language-configuration.json
```

*The exact directory structure may evolve as the project develops.*

---

## Current Limitations

SuperAnandLang is still an experimental language implementation.

Some features that are not yet implemented or fully developed:

- String variables.
- General mixed string and arithmetic concatenation.
- Conditional statements.
- Loops.
- Functions.
- Arrays and data structures.
- Floating-point and Boolean types.
- Abstract Syntax Tree (AST).
- Intermediate Representation (IR).
- Native machine-code generation.

---

## Learning Objectives

This project is an opportunity to explore:

- How lexical analyzers recognize programming language tokens.
- How context-free grammars describe language syntax.
- How Bison handles recursive grammar rules and parsing decisions.
- How semantic actions evaluate expressions.
- How symbol tables manage identifiers and values.
- How memory allocation and ownership work in C.
- How language syntax evolves as new features are introduced.

---

## Future Improvements

- Improve grammar design and reduce parsing ambiguity.
- Implement safer memory management.
- Expand string operations and concatenation.
- Introduce an Abstract Syntax Tree.
- Separate parsing from execution.
- Improve error reporting and recovery.
- Add automated test cases.
- Explore intermediate representation and code generation.

---

## Author

**SuperAnand67**

GitHub: https://github.com/SuperAnand67

---

## License

This project is licensed under the MIT License.
