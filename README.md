
<!--             Notes:              -->
<!--        Lily: 1/17/2022          -->
<!-- I love you more than I can say. -->

# sele

small asp.net static file share
sele comes from the word "serve" and "file"
the project came out of my need for easy static file serving
I needed to serve compiled binaries and compressed zipped files

## installing

### download compiled binaries

the only way to download the executable is to download the source code. the compiled binaries can be seen in the .bin folder where each version will be listed along with a zip of it. the binaries are the compiled program from my Windows machine using arm64. other platform binaries will be released later on you may also compile the source code yourself using the dotnet compiler. a real download method will be developed and the binaries will be removed.

start the compiled binaries by running the executable:
`sele.exe`

### compile source code

to compile the source code one must have the following installed:

- [git source control](https://git-scm.com/)
- [dotnet](https://dotnet.microsoft.com/en-us/)

one can open the sele solution file (sele.sin) in visual studio and compile the source code.

otherwise, compile using the dotnet cli:
`dotnet build`

## docker

soon...

## usage

to run the compiled binaries, one must have the following installed:
- [dotnet](https://dotnet.microsoft.com/en-us/)

start the compiled binaries by running the executable:
`sele.exe`

## contributing

create a fork of the source code repository, clone it, make the changes, and create a pull request. the pull request will be merged into the master breach.
