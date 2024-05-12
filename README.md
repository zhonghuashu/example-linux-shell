example-linux-shell
=================================
# Introduction
Example Linux Shell programming
- /bin/sh   : Bourne shell (first shell, now linked to other shell, e.g., bash, dash)
- /bin/bash : Bourne again shell (default shell in most linux distribution)

# Build and test
```shell
cd src
./main.sh
```

# Bash VS Code Linux Extension
## Bash Debug
A bash debugger GUI frontend based on awesome bashdb scripts.
- Select Debug -> Add Configuration to add custom debug configuration (`.vscode/launch.json`).
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "bashdb",
            "request": "launch",
            "name": "Bash-Debug (simplest configuration)",
            "program": "${file}"
        }
    ]
}
```
- Run and debug > Bash-Debug (or F5) 

## shellcheck
Static analysis tool for shell scripts.

## shell-format
A formatter for shell scripts, Dockerfile, gitignore, dotenv, /etc/hosts, jvmoptions, and other file types.
