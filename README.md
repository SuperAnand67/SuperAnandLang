# SuperAnandLang 🚀

**SuperAnandLang** is an experimental programming language built from scratch using **C, Flex, and Bison**. The project explores the fundamentals of programming language design, including lexical analysis, parsing, symbol tables, expression evaluation, and language-specific syntax highlighting.

The goal is to understand how programming languages work internally by building one.

## ✨ Features

SuperAnandLang currently supports:

- **Output statements** using the `whatis` keyword.
- **Integer variables** using the `believe` keyword.
- **Variable assignment and reassignment.**
- **Symbol table management** for storing and retrieving variable values.
- **Arithmetic operations:** `+`, `-`, `*`, `/`.
- **Operator precedence** and parentheses.
- **String literals** and string concatenation using `+`.
- **Increment and decrement operators:** `++` and `--`.
- **Single-line comments** using `$ ... $`.
- **Escape sequence handling** in strings.
- **Syntax and runtime error handling**, including undefined-variable errors.

## 🛠️ Technologies

| Technology | Purpose |
|---|---|
| C | Core implementation |
| Flex | Lexical analysis |
| Bison | Syntax analysis and parsing |
| GCC | Compilation |
| GNU Make | Build automation |
| TextMate Grammar | VS Code syntax highlighting |

## 📦 Installation

### Prerequisites

Install the required tools:

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

You can also launch the interpreter without specifying a file to provide input interactively:

```bash
./superanandlang
```

## 💻 Language Syntax

### 1. Output

Use `whatis` to display values.

```javascript
whatis "HelloWorld!";
whatis 293;
whatis 220 - 10 + 5;
```

### 2. Variables

Use `believe` to declare integer variables.

```javascript
believe x = 10;
believe y = 20;

whatis x;
whatis y;
```

Variables can also be reassigned:

```javascript
x = 50;
whatis x;
```

### 3. Arithmetic Operations

```javascript
whatis 10 + 20;
whatis 50 - 10;
whatis 5 * 6;
whatis 100 / 5;

whatis (10 + 5) * 2;
```

### 4. String Concatenation

The `+` operator can concatenate string literals.

```javascript
whatis "Hello" + "World!";
whatis "Super" + "Anand" + "Lang";
```

### 5. Increment and Decrement

SuperAnandLang supports postfix increment and decrement operators.

```javascript
believe x = 10;

x++;
whatis x;

x--;
whatis x;
```

### 6. Comments

Use `$` to write comments.

```javascript
$ This is a comment $

whatis "Hello World!";
```

### 7. Combined Example

```javascript
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

## 🧩 VS Code Syntax Highlighting Extension

SuperAnandLang also includes its own **Visual Studio Code language support extension**, making `.sal` programs easier to read and write.

The extension is developed using VS Code's TextMate grammar and language configuration.

### Features

- Syntax highlighting for SuperAnandLang source files.
- Recognition of language keywords such as `whatis` and `believe`.
- Highlighting for strings, numeric literals, operators, and comments.
- Language configuration for the `.sal` file extension.
- A dedicated language definition for SuperAnandLang.

### Extension Structure

```text
superanandlang-code/
├── package.json
├── language-configuration.json
└── syntaxes/
    └── superanandlang-code.tmLanguage.json
```

### Install the Extension

The repository includes a packaged VS Code extension:

```text
superanandlang-code-0.0.1.vsix
```

Install it through the VS Code command line:

```bash
code --install-extension superanandlang-code-0.0.1.vsix
```

Alternatively:

1. Open Visual Studio Code.
2. Navigate to the Extensions panel.
3. Select the three-dot menu.
4. Choose **Install from VSIX...**.
5. Select the packaged `.vsix` file.

After installation, open a `.sal` file to use SuperAnandLang syntax highlighting.

## ⚙️ How It Works

SuperAnandLang uses a traditional compiler-style front end to process source code.

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

Some features that are not currently implemented include:

- String variables.
- Conditional statements.
- Loops.
- User-defined functions.
- Arrays.
- Static type checking.
- Intermediate representation and machine-code generation.

## 🔮 Future Improvements

Potential future additions include:

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

*SuperAnandLang — Building a programming language, one token at a time.*
