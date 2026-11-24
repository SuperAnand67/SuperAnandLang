# SuperAnandLang

A small custom programming language built from scratch using **C, Flex, and Bison**.

SuperAnandLang is an experimental language project focused on understanding how programming languages work internally, particularly lexical analysis, parsing, grammar rules, and expression evaluation.

## ✨ Features

- **Custom Keywords:** Uses `whatis` as a statement for displaying output.
- **Arithmetic Expressions:** Supports addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- **Operator Precedence:** Multiplication and division are evaluated before addition and subtraction.
- **Parenthesized Expressions:** Supports parentheses for controlling evaluation order.
- **String Literals:** Supports printing strings enclosed in double quotes.
- **Escape Sequences:** Handles `\n`, `\t`, `\"`, and `\\` inside strings.
- **Comments:** Supports single-line and multiline comments using `$` delimiters.
- **Error Handling:** Detects invalid syntax and division-by-zero errors.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| C | Core implementation |
| Flex | Lexical analysis |
| Bison | Syntax analysis and parsing |
| GCC | Compilation |

## 📂 Project Structure

```text
SuperAnandLang/
│
├── lexical.l      # Lexer implementation
├── parser.y       # Grammar and parser implementation
├── scanner.l      # Standalone lexical scanner experiment
│
├── test.sa        # Language test program
├── input.txt      # Sample input program
├── sample.sa      # Additional language syntax examples
│
└── README.md
```

## ⚙️ Installation and Setup

### Prerequisites

Install GCC, Flex, and Bison.

**Ubuntu / Debian / Linux Mint**

```bash
sudo apt update
sudo apt install gcc flex bison
```

### Clone the Repository

```bash
git clone https://github.com/SuperAnand67/SuperAnandLang.git
cd SuperAnandLang
```

### Compile the Language

**Step 1: Generate the parser**

```bash
bison -d parser.y
```

**Step 2: Generate the lexer**

```bash
flex lexical.l
```

**Step 3: Compile the generated C files**

```bash
gcc parser.tab.c lex.yy.c -o superanandlang
```

## 🚀 Running Programs

Run a source file:

```bash
./superanandlang test.sa
```

You can also execute the interpreter interactively:

```bash
./superanandlang
```

Enter statements through standard input.

## 📖 Language Syntax

### 1. Output Statements

The `whatis` keyword is used to evaluate and display an expression or string.

```text
whatis 100;
whatis "Hello, World!";
```

Output:

```text
100
Hello, World!
```

### 2. Arithmetic Operations

```text
whatis 10 + 20;
whatis 50 - 15;
whatis 5 * 6;
whatis 100 / 4;
```

Output:

```text
30
35
30
25
```

### 3. Operator Precedence

SuperAnandLang follows conventional arithmetic precedence.

```text
whatis 10 + 20 * 5;
whatis (100 + 50) / 5;
```

Output:

```text
110
30
```

### 4. String Literals

```text
whatis "Welcome to SuperAnandLang!";
whatis "Building my own programming language!";
```

### 5. Comments

Comments are enclosed between `$` delimiters.

```text
$ This is a single-line comment $

whatis 100;

$ This is
  a multiline
  comment $
```

### 6. Escape Sequences

String literals support common escape sequences.

```text
whatis "Hello\nWorld";
whatis "Hello\tWorld";
whatis "This is a \"quoted\" string";
```

## 🧠 How It Works

SuperAnandLang uses a traditional compiler-front-end approach.

```text
     Source Code (.sa)
            |
            v
    Lexical Analysis
         (Flex)
            |
            v
       Token Stream
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

**Lexical Analysis**

The Flex lexer (`lexical.l`) reads the source code and identifies tokens such as keywords, numbers, strings, operators, and comments.

**Syntax Analysis**

The Bison parser (`parser.y`) defines the grammar and checks whether the token sequence follows the language's syntax.

**Expression Evaluation**

The parser evaluates arithmetic expressions using grammar rules that establish operator precedence and associativity.

## 🔬 Learning Objectives

This project explores:

- Designing a simple programming language.
- Writing lexical rules using Flex.
- Defining context-free grammars using Bison.
- Understanding tokens and semantic values.
- Implementing arithmetic expression evaluation.
- Handling syntax errors and runtime evaluation errors.

## 🚧 Future Improvements

- Variable declaration and assignment.
- User input statements.
- Conditional statements (`if` / `else`).
- Loops and iteration.
- Comparison and logical operators.
- Better error reporting.
- Symbol table implementation.
- Intermediate code generation.

## 👨‍💻 Author

**Anand**

Computer Science Engineering Student

GitHub: [@SuperAnand67](https://github.com/SuperAnand67)

---

*SuperAnandLang is an experimental project developed to explore the fundamentals of programming language design and compiler construction.*
