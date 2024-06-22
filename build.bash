#!/bin/bash
# mcu build script. 

MCU_VERSION="0.0"

ASM="nasm"
LD="ld"

ASMFLAGS="-felf64 -Iinc/"
LDFLAGS="-s"

ASMDIR="asm/"
OBJDIR="obj/"
BINDIR="bin/"

function build() {
        PROGRAMS=("argtest cat")

        echo "==> Building MCU"
        for i in $PROGRAMS
        do
                INNAME="$ASMDIR$i.s"
                OBJNAME="$OBJDIR$i.o"
                BINNAME="$BINDIR$i"

                printf "\tASM $ASMFLAGS $INNAME -o $OBJNAME\n"
                $ASM $ASMFLAGS $INNAME -o $OBJNAME || exit 1
                
                printf "\tLD  $LDFLAGS $OBJNAME -o $BINNAME\n"
                $LD $LDFLAGS $OBJNAME -o $BINNAME || exit 2
        done
        echo "==> Build finished!"
}

function setup() {
        if [ ! -d "$OBJDIR" ]; then
          mkdir $OBJDIR
        fi

        if [ ! -d "$BINDIR" ]; then
                mkdir $BINDIR
        fi
}

echo "MCU Buildscript, Release $MCU_VERSION"

setup
build
