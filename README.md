# Installation

all commands are executet on the cmd

Needs .Net core installed

## new classlib

```
dotnet new classlib –name <Name>
cd <Name>
```

## add PowerShell capabilities

```
dotnet add package PowerShellStandard.Library
```

## or create it from a template:

```
dotnet new -i Microsotft.PowerShell.Standard.Module.Template
```

```
dotnet new psmodule
```
