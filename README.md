# SuperAnandLang 🚀

<div align="centre">

<img src="assets/superanandlang-logo.png" width="750">

</div>

---

 **SuperAnandLang** is an experimental programming language built from scratch using **C, Flex, and Bison**. The project explores programming language design through lexical analysis, parsing, symbol tables, expression evaluation, and custom editor support.

## ✨ Features

- Output statements using `whatis`.
- Integer variable declarations using `believe`.
- Variable assignment and reassignment.
- Variable declarations without an initial value.
- Two-dimensional symbol table for variable storage and lookup.
- Arithmetic operators: `+`, `-`, `*`, `/`.
- Compound assignment operators: `+=`, `-=`, `*=`, `/=`.
- Operator precedence and parentheses.
- String literals and concatenation using `+`.
- String concatenation with numeric expressions.
- Postfix increment and decrement: `++`, `--`.
- Single-line comments using `$$`.
- Multiline comments using `$ ... $`.
- String escape sequence handling.
- `exit()` command for leaving the interpreter.
- Syntax and runtime error handling, including undefined-variable errors.

## 🛠️ Technologies

| Technology | Purpose |
|---|---|
| C | Core implementation |
| Flex | Lexical analysis |
| Bison | Parsing |
| GCC | Compilation |
| GNU Make | Build automation |
| TextMate Grammar | VS Code syntax highlighting |

## 📦 Installation

### Prerequisites

```bash
sudo apt update
sudo apt install gcc flex bison make
```

### Clone the repository

```bash
git clone https://github.com/SuperAnand67/SuperAnandLang.git
cd SuperAnandLang
```

### Build

```bash
make
```

### Execute a program

```bash
./superanandlang test.sal
```

Run the interpreter interactively:

```bash
./superanandlang
```

## 💻 SuperAnandLang Syntax

### 1. Output

The `whatis` keyword displays values.

```superanandlang
whatis "HelloWorld!";
whatis 293;
whatis 220 - 10 + 5;
```

### 2. Variables

Use `believe` to declare integer variables.

```superanandlang
believe x = 10;
believe y = 20;

whatis x;
whatis y;
```

Variables can also be declared without an initial value:

```superanandlang
believe z;
whatis z;
```

Variables can be reassigned:

```superanandlang
x = 50;
whatis x;
```

### 3. Arithmetic Operations

```superanandlang
whatis 10 + 20;
whatis 50 - 10;
whatis 5 * 6;
whatis 100 / 5;

whatis (10 + 5) * 2;
```

### 4. String Concatenation

The `+` operator supports concatenation of string literals.

```superanandlang
whatis "Hello" + "World!";
whatis "Super" + "Anand" + "Lang";
```

Strings can also be concatenated with numeric expressions.

```superanandlang
believe x = 20;

whatis "The value of x is: " + x;
whatis "Result: " + (10 + 20);
```

### 5. Increment and Decrement

SuperAnandLang supports postfix increment and decrement operators.

```superanandlang
believe x = 10;

x++;
whatis x;

x--;
whatis x;
```

### 6. Comments

Use `$ ... $` for multiline comments.

Use `$$` for single-line comments.

```superanandlang
$ This is a
  multiline comment
$

$$ This is a single-line comment

whatis "Hello World!";
```

### 7. Combined Example

```superanandlang
$ Welcome to SuperAnandLang $

believe x = 10;
believe y = 20;

believe result = x + y;

whatis "Calculation Result:";
whatis result;

x++;
whatis x;

whatis "Super" + "Anand" + "Lang";
```

### 8. Compound Assignment

SuperAnandLang supports compound assignment operators.

```superanandlang
believe x = 10;

x += 10;
whatis x;

x -= 5;
whatis x;

x *= 2;
whatis x;

x /= 3;
whatis x;
```

### 9. Exit Command

Use `exit()` to leave the interactive interpreter.

```superanandlang
exit()
```

## 🧩 VS Code Syntax Highlighting Extension

SuperAnandLang includes its own **Visual Studio Code language support extension**, allowing `.sal` source files to have dedicated syntax highlighting.

The extension uses TextMate grammar and VS Code language configuration.

### Features

- Syntax highlighting for SuperAnandLang source files.
- Recognition of keywords such as `whatis` and `believe`.
- Highlighting for strings, numeric literals, operators, and comments.
- Language configuration for `.sal` files.
- Dedicated language definition for SuperAnandLang.
- Bracket matching and automatic closing pairs.

### Extension Structure

```text
superanandlang-code/
├── package.json
├── language-configuration.json
└── syntaxes/
    └── superanandlang-code.tmLanguage.json
```

### Install the Extension

The extension version is currently defined as `0.0.2` in `package.json`.

Install the packaged VS Code extension from the repository:

```bash
code --install-extension ./superanandlang-code-0.0.2.vsix
```

Alternatively, open VS Code, navigate to Extensions, select **Install from VSIX...**, and choose the packaged extension.

Open a `.sal` file to use SuperAnandLang syntax highlighting.

## ⚙️ How It Works

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
       Semantic Processing
               |
               v
       Symbol Table Management
               |
               v
       Expression Evaluation
               |
               v
             Output
```

## 🚧 Current Limitations

SuperAnandLang is still under development.

Currently unimplemented features include:

- String variables.
- Conditional statements.
- Loops.
- User-defined functions.
- Arrays.
- Static type checking.
- Intermediate representation and machine-code generation.
- More flexible mixed string and expression concatenation.

## 🔮 Future Improvements

- Conditional statements and loops.
- Support for additional data types.
- User-defined functions.
- More advanced expression handling.
- Improved error reporting.
- Expanded VS Code language support.

## 👨‍💻 Author

**Anand**

Computer Science and Engineering Student

- GitHub: [SuperAnand67](https://github.com/SuperAnand67)
- Project: [SuperAnandLang](https://github.com/SuperAnand67/SuperAnandLang)

---

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

*SuperAnandLang — Building a programming language, one token at a time.*
