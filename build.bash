#!/bin/bash
# mcu build script. 

MCU_VERSION="0.0"

ASM="fasm"
LD="ld"

ASMFLAGS=""
LDFLAGS="-s"

ASMDIR="asm/"
OBJDIR="obj/"
BINDIR="bin/"

function build() {
        PROGRAMS=("argtest cat hexdump")

        echo "==> Building MCU"
        for i in $PROGRAMS
        do
                INNAME="$ASMDIR$i.asm"
                OUTNAME="$ASMDIR$i"
                BINNAME="$BINDIR$i"

                printf "  FASM $ASMFLAGS $INNAME\n"
                fasm $ASMFLAGS $INNAME || exit 1

                printf "  MV $OUTNAME $BINNAME\n"
                mv $OUTNAME $BINNAME
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
