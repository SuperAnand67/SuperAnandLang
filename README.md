SuperAnandLang 🚀

SuperAnandLang is an experimental programming language built from scratch using C, Flex, and Bison. The project explores programming language design and implementation through lexical analysis, parsing, semantic processing, symbol tables, expression evaluation, and custom editor support.

The goal is to understand how programming languages work internally by building one from the ground up.

✨ Features

Language Features

- Output statements: Display values using "whatis".
- Variable declarations: Declare integer variables using "believe".
- Variable assignment: Assign and update existing variables.
- Symbol table: Store, search, and manage variable values.
- Arithmetic operations: Addition ("+"), subtraction ("-"), multiplication ("*"), and division ("/").
- Operator precedence: Evaluate arithmetic expressions with parentheses.
- Compound assignment: Support "+=", "-=", "*=", and "/=".
- Increment and decrement: Postfix "++" and "--" operators.
- String literals: Support double-quoted strings.
- String concatenation: Combine string literals using "+", with basic integer-expression concatenation support.
- Comments: Support single-line ("$$") and multiline ("$ ... $") comments.
- Escape sequences: Handle "\n", "\t", "\"", and "\\".
- Exit command: Terminate execution using "exit()".

Error Handling

- Undefined variable detection.
- Duplicate variable declaration detection.
- Division-by-zero detection.
- Invalid character and syntax detection.

🛠️ Technologies

Technology| Purpose
C| Core implementation and semantic actions
Flex| Lexical analysis and tokenization
Bison| Syntax analysis and grammar parsing
GCC| Compilation
GNU Make| Build automation
TextMate Grammar| VS Code syntax highlighting

📦 Installation

Prerequisites

Install the required tools:

sudo apt update
sudo apt install gcc flex bison make

Clone the repository

git clone https://github.com/SuperAnand67/SuperAnandLang.git
cd SuperAnandLang

Build

make

Run a program

./superanandlang test.sal

Interactive execution

./superanandlang

💻 SuperAnandLang Syntax

1. Output Statements

Use "whatis" to display values.

whatis "Hello World!";
whatis 293;
whatis 220 - 10 + 100;
whatis (20 + 10) * 2;

2. Variable Declaration

Use "believe" to declare integer variables.

believe x = 10;
believe y = 20;

whatis x;
whatis y;

Variables can also be declared without an initial value. They are initialized to "0".

believe result;
result = 100;

whatis result;

3. Variable Assignment

Existing variables can be reassigned.

believe x = 10;

x = 50;

whatis x;

4. Arithmetic Operations

SuperAnandLang supports basic arithmetic operators and parentheses.

whatis 10 + 20;
whatis 50 - 10;
whatis 5 * 6;
whatis 100 / 5;

whatis (10 + 5) * 2;

5. String Concatenation

Combine string literals using the "+" operator.

whatis "Hello" + "World!";

whatis "Super" + "Anand" + "Lang";

Basic concatenation between strings and integer expressions is also supported:

believe age = 20;

whatis "Age: " + age;

6. Compound Assignment

Update variables using compound assignment operators.

believe x = 10;

x += 5;
whatis x;

x -= 2;
whatis x;

x *= 3;
whatis x;

x /= 2;
whatis x;

7. Increment and Decrement

SuperAnandLang supports postfix increment and decrement.

believe x = 10;

x++;
whatis x;

x--;
whatis x;

8. Comments

Use "$$" for single-line comments and "$ ... $" for multiline comments.

$$ This is a single-line comment

$ 
    This is a
    multiline comment
$

whatis "Hello World!";

9. String Escape Sequences

Supported escape sequences include:

Escape sequence| Meaning
"\n"| Newline
"\t"| Tab
"\""| Double quote
"\\"| Backslash

Example:

whatis "Hello\nWorld!";
whatis "Super\tAnand";
whatis "This is a \"string\"";

10. Exit Command

Terminate the program using "exit()".

whatis "Program started!";

exit();

whatis "This will not execute.";

🧩 VS Code Language Support

SuperAnandLang includes a dedicated VS Code language extension for ".sal" files.

The extension uses TextMate grammar and VS Code language configuration.

Features

- Syntax highlighting for SuperAnandLang source files.
- Keyword recognition ("whatis", "believe", "exit").
- Integer and string literal highlighting.
- Arithmetic and compound assignment operator highlighting.
- Single-line and multiline comment highlighting.
- Bracket matching and automatic pair insertion.
- Comment toggling support.

Extension Structure

superanandlang-code/
├── package.json
├── language-configuration.json
└── syntaxes/
    └── superanandlang-code.tmLanguage.json

Install the Extension

The repository includes a packaged VS Code extension.

Install it using:

code --install-extension superanandlang-code-0.0.2.vsix

Alternatively, open VS Code:

1. Navigate to Extensions.
2. Select Install from VSIX....
3. Choose the packaged extension.
4. Open a ".sal" file.

⚙️ How It Works

SuperAnandLang follows a traditional lexer-parser architecture.

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
        Expression Evaluation
                  |
                  v
               Output

Project Structure

SuperAnandLang/
│
├── parser.y
├── lexical.l
├── Makefile
├── test.sal
├── README.md
│
├── superanandlang-code/
│   ├── package.json
│   ├── language-configuration.json
│   └── syntaxes/
│       └── superanandlang-code.tmLanguage.json
│
└── LICENSE

🔨 Build Commands

The project uses GNU Make to automate the build process.

Command| Description
"make"| Build the interpreter
"make run"| Build and execute "test.sal"
"make run TEST_FILE=example.sal"| Execute a custom source file
"make clean"| Remove generated files and executable

🚧 Current Limitations

SuperAnandLang is an ongoing experimental project.

Some features are still under development or not implemented:

- String variables and string assignment.
- General-purpose mixed string and arithmetic concatenation.
- Conditional statements.
- Loops.
- User-defined functions.
- Arrays and collections.
- Additional data types such as floating-point numbers and booleans.
- Static type checking.
- Abstract Syntax Tree (AST).
- Intermediate representation.
- Native machine-code generation.

🔮 Future Improvements

- Improve string concatenation and expression handling.
- Introduce an Abstract Syntax Tree.
- Improve memory management and error recovery.
- Implement conditional statements and loops.
- Introduce additional data types.
- Implement functions and scoped variables.
- Expand automated testing.
- Explore intermediate representation and code generation.
- Improve VS Code language support.

👨‍💻 Author

Anand

Computer Science and Engineering Student

- GitHub: "SuperAnand67" (https://github.com/SuperAnand67)
- Project: "SuperAnandLang" (https://github.com/SuperAnand67/SuperAnandLang)

---

"License: MIT" (https://img.shields.io/badge/License-MIT-yellow.svg)

SuperAnandLang — Building a programming language, one token at a time.