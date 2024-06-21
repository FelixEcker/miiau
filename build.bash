#!/bin/bash
# mcu build script. 

MCU_VERSION="0.0"

ASM="nasm"
LD="ld"

ASMFLAGS="-felf64"
LDFLAGS=""

OBJDIR="obj/"
BINDIR="bin/"

function build_objs() {
  COMPILED_OBJECTS=()

  for i in $1
  do
    OUTNAME="$OBJDIR$i.o"
    INNAME="$SRCDIR$i.c"

    echo "  CC $INNAME"

    $CC $CFLAGS -c -o $OUTNAME $INNAME || exit

    COMPILED_OBJECTS+=("${OUTNAME}")
  done
}

function build() {
        PROGRAMS=("argtest cat")

        echo "==> Building MCU"
        for i in $PROGRAMS
        do
                INNAME="$i.s"
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
