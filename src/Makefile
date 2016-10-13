CC=sdcc
EXEC=stm8_firmware
BOOTLOADER_ADDRESS=0x8000

SRCC= $(wildcard *.c)
OBJ= $(SRCC:.c=.rel)

CFLAGS=-lstm8 -mstm8 -I./ 
LDFLAGS=-Wl-bHOME=$(BOOTLOADER_ADDRESS) -lstm8 -mstm8

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC).ihx $(LDFLAGS)

clean:
	rm -rf $(EXEC).ihx
	rm -rf *.rel
	rm -rf *.asm
	rm -rf *.lst
	rm -rf *.sym
	rm -rf *.lk
	rm -rf *.mem
	rm -rf *.rst
	rm -rf *.map
	rm -rf *.cdb

flash: $(EXEC)
	../stm8flash/stm8flash -c stlinkv2 -p stm8s103f3 -w $(EXEC).ihx

%.rel: %.c
	$(CC) -c $< $(CFLAGS)
