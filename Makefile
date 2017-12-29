#彭东 @ 2017.12.29

MAKEFLAGS = -sR
MKDIR = mkdir
RMDIR = rmdir
CP = cp
CD = cd
DD = dd
RM = rm

ASM		= nasm
CC		= gcc
LD		= ld
OBJCOPY = objcopy
OJCYFLAGS = -S -O binary

ASMBFLAGS	= -f elf
CFLAGS		= -c -Os -std=c99 -m32 -Wall -Wshadow -W -Wconversion -Wno-sign-conversion  -fno-stack-protector -fomit-frame-pointer -fno-builtin -fno-common  -ffreestanding  -Wno-unused-parameter -Wunused-variable
LDFLAGS		= -s -static -T hello.lds -n

PMHELLO_OBJS :=
PMHELLO_OBJS += entry.o helkrlmain.o vgastr.o
PMHELLO_ELF = pmhello.elf
PMHELLO_BIN = pmhello.bin
.PHONY : build clean all link

all: clean build link bin

clean:
	$(RM) -f *.o *.bin *.elf

build: $(PMHELLO_OBJS)

link: $(PMHELLO_ELF) 
bin:  $(PMHELLO_BIN)
$(PMHELLO_ELF): $(PMHELLO_OBJS)
	$(LD) $(LDFLAGS) -o $@ $(PMHELLO_OBJS)
$(PMHELLO_BIN):$(PMHELLO_ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@

%.o : %.asm
	$(ASM) $(ASMBFLAGS) -o $@ $<
%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<


