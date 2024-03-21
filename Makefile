ASPARAMS = --32
GCCPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
		gcc $(GCCPARAMS) -c -o $@ $<

%.o: %.s
		as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
		ld $(LDPARAMS) -T $< -o $@ $(objects)

install : mykernel.bin
	sudo cp $< /boot/mykernel.bin
