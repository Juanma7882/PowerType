[PowerTypeDictionary]@{
    Keys        = @(""," ");
    Name        = "Console";
    Description = "Common console and shell";
    Platforms   = ([Platforms]::All);
    State       = [DictionaryState]::Experimental -bor [DictionaryState]::Incomplete;
    Source      = "Hand crafted";
    Url         = "https://learn.microsoft.com/en-us/powershell/";
    Version     = [Version]::Parse("0.0.2");

    Parameters  = @(
        # ------------------------------
        # Directory Browsing
        # ------------------------------
        [CommandParameter]@{
            Keys = @("cd", "chdir");
            Name = "cd";
            Description = "Change the current working directory";
            Parameters = @(
                [ValueParameter]@{
                    Name = "path";
                    Description = "Target directory path";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("dir", "ls");
            Name = "list";
            Description = "List files and directories";
            Parameters = @(
                [FlagParameter]@{
                    Keys = @("a", "-a", "/a");
                    Name = "all";
                    Description = "Show hidden files";
                },
                [FlagParameter]@{
                    Keys = @("l", "-l");
                    Name = "long";
                    Description = "Long listing format";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("pwd");
            Name = "pwd";
            Description = "Print the current working directory";
        },

        # ------------------------------
        # Files and directories
        # ------------------------------
        [CommandParameter]@{
            Keys = @("mkdir", "md");
            Name = "mkdir";
            Description = "Create a new directory";
            Parameters = @(
                [ValueParameter]@{
                    Name = "name";
                    Description = "Name of the directory to create";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("rmdir", "rd");
            Name = "rmdir";
            Description = "Remove a directory";
            Parameters = @(
                [ValueParameter]@{
                    Name = "path";
                    Description = "Path of the directory to remove";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("del", "rm");
            Name = "remove";
            Description = "Delete one or more files";
            Parameters = @(
                [ValueParameter]@{
                    Name = "file";
                    Description = "File(s) to delete";
                },
                [FlagParameter]@{
                    Keys = @("f", "-f", "/f");
                    Name = "force";
                    Description = "Force deletion without confirmation";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("copy", "cp");
            Name = "copy";
            Description = "Copy files or directories";
            Parameters = @(
                [ValueParameter]@{
                    Name = "source";
                    Description = "Source path";
                },
                [ValueParameter]@{
                    Name = "destination";
                    Description = "Destination path";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("move", "mv");
            Name = "move";
            Description = "Move or rename files and directories";
            Parameters = @(
                [ValueParameter]@{
                    Name = "source";
                    Description = "Source path";
                },
                [ValueParameter]@{
                    Name = "destination";
                    Description = "Destination path";
                }
            )
        },

        # ------------------------------
        # System
        # ------------------------------
        [CommandParameter]@{
            Keys = @("clear", "cls");
            Name = "clear";
            Description = "Clear the console screen";
        },
        [CommandParameter]@{
            Keys = @("echo");
            Name = "echo";
            Description = "Display text or variable values";
            Parameters = @(
                [ValueParameter]@{
                    Name = "message";
                    Description = "Text to display";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("exit");
            Name = "exit";
            Description = "Exit the current terminal session";
        },

        # ------------------------------
        # System information
        # ------------------------------
        [CommandParameter]@{
            Keys = @("whoami");
            Name = "whoami";
            Description = "Display the current user name";
        },
        [CommandParameter]@{
            Keys = @("hostname");
            Name = "hostname";
            Description = "Show the computer's hostname";
        },
        [CommandParameter]@{
            Keys = @("systeminfo");
            Name = "systeminfo";
            Description = "Display system information such as OS version and memory";
        },
        [CommandParameter]@{
            Keys = @("ver");
            Name = "ver";
            Description = "Show the operating system version";
        },

        # ------------------------------
        # Processes
        # ------------------------------
        [CommandParameter]@{
            Keys = @("tasklist", "ps");
            Name = "tasklist";
            Description = "Display a list of currently running processes";
        },
        [CommandParameter]@{
            Keys = @("taskkill", "kill");
            Name = "taskkill";
            Description = "Terminate a process by PID or name";
            Parameters = @(
                [ValueParameter]@{
                    Name = "pid_or_name";
                    Description = "Process ID or name to terminate";
                },
                [FlagParameter]@{
                    Keys = @("f", "-f", "/f");
                    Name = "force";
                    Description = "Force termination";
                }
            )
        },

        # ------------------------------
        # Network and connectivity
        # ------------------------------
        [CommandParameter]@{
            Keys = @("ping");
            Name = "ping";
            Description = "Test network connectivity to a host";
            Parameters = @(
                [ValueParameter]@{
                    Name = "host";
                    Description = "Hostname or IP address to ping";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("tracert", "traceroute");
            Name = "tracert";
            Description = "Trace the route packets take to a destination";
            Parameters = @(
                [ValueParameter]@{
                    Name = "host";
                    Description = "Hostname or IP address to trace";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("ipconfig", "ifconfig");
            Name = "ipconfig";
            Description = "Display network configuration information";
            Parameters = @(
                [FlagParameter]@{
                    Keys = @("/all", "-a");
                    Name = "all";
                    Description = "Show all details";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("netstat");
            Name = "netstat";
            Description = "Display active TCP/UDP connections and listening ports";
            Parameters = @(
                [FlagParameter]@{
                    Keys = @("-a", "/a");
                    Name = "all";
                    Description = "Show all connections and listening ports";
                },
                [FlagParameter]@{
                    Keys = @("-n", "/n");
                    Name = "numeric";
                    Description = "Show addresses and port numbers in numeric form";
                },
                [FlagParameter]@{
                    Keys = @("-o", "/o");
                    Name = "pid";
                    Description = "Display process ID (PID) for each connection";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("curl", "wget");
            Name = "curl";
            Description = "Transfer data from or to a server via HTTP, HTTPS, or FTP";
            Parameters = @(
                [ValueParameter]@{
                    Name = "url";
                    Description = "URL to fetch";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("nslookup", "dig");
            Name = "nslookup";
            Description = "Query DNS servers for domain information";
            Parameters = @(
                [ValueParameter]@{
                    Name = "domain";
                    Description = "Domain name to resolve";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("netsh");
            Name = "netsh";
            Description = "Display or modify network configuration";
        },
        [CommandParameter]@{
            Keys = @("Get-NetTCPConnection");
            Name = "Get-NetTCPConnection";
            Description = "Display active TCP connections (PowerShell native)";
        }
    )
}
