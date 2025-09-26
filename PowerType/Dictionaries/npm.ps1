$scripts = [DynamicSource]@{
    Name = "Scripts";
    Description = "A list of all scripts defined in package.json";
    CommandExpression = {
        $packageFile = Find-FileRecursive $pwd.Path 'package.json'
        if ($packageFile) {
            (Get-Content $packageFile | ConvertFrom-Json).scripts.PSObject.Properties | % { $_.Name }
        }
    };
    Cache = [Cache]@{
        ByCurrentWorkingDirectory = $true;
        ByTime = New-TimeSpan -Seconds 10
    }
}

[PowerTypeDictionary]@{
    Keys        = @("npm");
    Name        = "npm";
    Description = "the package manager for JavaScript";
    Platforms   = ([Platforms]::All);
    State       = [DictionaryState]::Experimental -bor [DictionaryState]::Incomplete;
    Source      = "Hand crafted";
    Url         = "https://www.npmjs.com/";
    Version     = [Version]::Parse("0.0.2");
    Parameters  = @(
        [CommandParameter]@{
            Keys = @("start");
            Name = "start";
            Description = "Alias for 'npm run start'";
        },
        [CommandParameter]@{
            Keys        = @("run", "run-script", "rum", "urn");
            Name        = "run";
            Description = "Run the specified npm script";
            Parameters  = @(
                [ValueParameter]@{
                    Name = "script";
                    Description = "What script to run";
                    Source = $scripts;
                }
            )
        },
        [CommandParameter]@{
            Keys = @("install","i");
            Name = "install";
            Description = "Install everything in package.json";
            Parameters  = @(
                # Common database drivers and ORMs
                [FlagParameter]@{
                    Keys = @("mysql");
                    Name = "mysql";
                    Description = "Installs the original package to interact with MySQL from Node.js";
                },
                [FlagParameter]@{
                    Keys = @("mysql2");
                    Name = "mysql2";
                    Description = "Installs the improved, faster MySQL driver";
                },
                [FlagParameter]@{
                    Keys = @("pg");
                    Name = "pg";
                    Description = "Installs the PostgreSQL client for Node.js (also called node-postgres)";
                },
                [FlagParameter]@{
                    Keys = @("pg-promise");
                    Name = "pg-promise";
                    Description = "Installs a simpler, promise-based interface for PostgreSQL";
                },
                [FlagParameter]@{
                    Keys = @("mongoose");
                    Name = "mongoose";
                    Description = "Installs an ODM (Object Document Mapping) for MongoDB with schemas and validation";
                },
                [FlagParameter]@{
                    Keys = @("mongodb");
                    Name = "mongodb";
                    Description = "Installs the official MongoDB driver for Node.js";
                },
                [FlagParameter]@{
                    Keys = @("sqlite3");
                    Name = "sqlite3";
                    Description = "Installs the SQLite binding for Node.js";
                },
                [FlagParameter]@{
                    Keys = @("better-sqlite3");
                    Name = "better-sqlite3";
                    Description = "Installs a faster and simpler version of SQLite";
                },
                [FlagParameter]@{
                    Keys = @("redis");
                    Name = "redis";
                    Description = "Installs the modern Redis client for Node.js";
                },
                [FlagParameter]@{
                    Keys = @("ioredis");
                    Name = "ioredis";
                    Description = "Installs a robust Redis client with more features";
                },
                [FlagParameter]@{
                    Keys = @("tedious");
                    Name = "tedious";
                    Description = "Installs the official Microsoft SQL Server (MSSQL) driver for Node.js";
                },
                [FlagParameter]@{
                    Keys = @("sequelize");
                    Name = "sequelize";
                    Description = "Installs Sequelize, a promise-based ORM supporting PostgreSQL, MySQL, MariaDB, SQLite and SQL Server";
                },
                [FlagParameter]@{
                    Keys = @("typeorm");
                    Name = "typeorm";
                    Description = "Installs TypeORM, a feature-rich ORM supporting Active Record and Data Mapper patterns for TypeScript and JavaScript";
                },
                [FlagParameter]@{
                    Keys = @("prisma");
                    Name = "prisma";
                    Description = "Installs Prisma, a modern ORM with auto-generated queries, migrations and type-safe client for Node.js";
                },
                [FlagParameter]@{
                    Keys = @("objection");
                    Name = "objection";
                    Description = "Installs Objection.js, an SQL-friendly ORM built on top of Knex.js for flexible query building";
                },
                [FlagParameter]@{
                    Keys = @("bookshelf");
                    Name = "bookshelf";
                    Description = "Installs Bookshelf.js, an ORM built on top of Knex.js that provides relations and plugins";
                },
                # finish common database drivers and ORMs
                [FlagParameter]@{
                    Keys = @("typescript");
                    Name = "typescript";
                    Description = "Installs TypeScript locally";
                }
            )
        },
        [CommandParameter]@{
            Keys = @("init");
            Name = "init";
            Description = "This command initializes a package by creating a package.json file.";
        },
        [CommandParameter]@{
            Keys = @("uninstall","remove");
            Name = "uninstall";
            Description = "uninstall a package";
        },
        [CommandParameter]@{
            Keys = @("update");
            Name = "update";
            Description = "update a package";
        },
        [CommandParameter]@{
            Keys = @("outdated");
            Name = "outdated";
            Description = "list outdated packages";
        },
        [CommandParameter]@{
            Keys = @("audit");
            Name = "audit";
            Description = "check for security vulnerabilities";
        },
        [CommandParameter]@{
            Keys = @("list","ls","la","ll");
            Name = "list";
            Description = "list installed packages";
        },
        [CommandParameter]@{
            Keys = @("search","s");
            Name = "search";
            Description = "search for packages";
        },
        [CommandParameter]@{
            Keys = @("help","h","?");
            Name = "help";
            Description = "show help";
        },
        [CommandParameter]@{
            Keys = @("version","v");
            Name = "version";
            Description = "show version";
        }
    )
}
