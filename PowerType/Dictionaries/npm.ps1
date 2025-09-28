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
            Keys = @("list","la","ll");
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
        },
        [CommandParameter]@{
            Keys = @("install","i");
            Name = "install";
            Description = "Install everything in package.json";
            Parameters  = @(
                # Paquetes comunes (drivers, ORMs, etc.)
                [ValueParameter]@{
                    Name        = "package";
                    Description = "The npm package to install";
                    Source      = [StaticSource]@{
                        Name  = "Common npm packages";
                        Items = @(
                            [SourceItem]@{
                                Name = "mysql";
                                Description = "Original MySQL driver";
                            },
                            [SourceItem]@{
                                Name = "mysql2";
                                Description = "Faster MySQL driver";
                            },
                            [SourceItem]@{
                                Name = "pg";
                                Description = "PostgreSQL client (node-postgres)";
                            },
                            [SourceItem]@{
                                Name = "pg-promise";
                                Description = "Promise-based PostgreSQL client";
                            },
                            [SourceItem]@{
                                Name = "mongoose";
                                Description = "MongoDB ODM with schemas";
                            },
                            [SourceItem]@{
                                Name = "mongodb";
                                Description = "Official MongoDB driver";
                            },
                            [SourceItem]@{
                                Name = "sqlite3";
                                Description = "SQLite binding";
                            },
                            [SourceItem]@{
                                Name = "better-sqlite3";
                                Description = "Faster SQLite library";
                            },
                            [SourceItem]@{
                                Name = "redis";
                                Description = "Modern Redis client";
                            },
                            [SourceItem]@{
                                Name = "ioredis";
                                Description = "Advanced Redis client";
                            },
                            [SourceItem]@{
                                Name = "tedious";
                                Description = "MSSQL driver for Node.js";
                            },
                            [SourceItem]@{
                                Name = "sequelize";
                                Description = "Promise-based ORM";
                            },
                            [SourceItem]@{
                                Name = "typeorm";
                                Description = "ORM with Active Record & Data Mapper";
                            },
                            [SourceItem]@{
                                Name = "prisma";
                                Description = "Modern type-safe ORM";
                            },
                            [SourceItem]@{
                                Name = "objection";
                                Description = "ORM built on Knex.js";
                            },
                            [SourceItem]@{
                                Name = "bookshelf";
                                Description = "ORM built on Knex.js with plugins";
                            },
                            [SourceItem]@{
                                Name = "typescript";
                                Description = "TypeScript compiler";
                            }
                        )
                    }
                }
            )   
        }
    )
}
