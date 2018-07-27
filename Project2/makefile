#
# Leave the following lines alone!!!

LDFLAGS=-melf_i386
%.o: %.asm
	nasm -f elf -g -l $*.lst $< -o $@

#
# End of provided rules
#

# Modify following to the name of your linked program
TARGET=psrt_dec.out

# Modify following to the list of component object files
OBJS=psrt_dec.o mytest3.o

#
# Do not modify remainder of this Makefile
#
${TARGET}: ${OBJS}
	${LD} ${LDFLAGS} ${OBJS} -o ${TARGET}
