# MIIAU 
Marie's Insipid & Inferior Assembled Utils

## About
MIIAU are utilities written in 100% memory unsafe and "blazingly fast" assembly and out of 100% unbearable boredom.
They consist of:
- [X] argtest
- [X] cat
- [ ] hexdump

## Requirements
* bash
* fasm

## Directory Strucutre
- `inc/` contains a bunch of include files with shared code (such as syscall definitions, commonly used subroutines, etc.)
- `asm/` contains the actual sources for each program. Each program only gets one source file
- `bin/` contains the assembled executables after `./build.bash` was run
