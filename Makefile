LLVM_BIN=/usr/lib/llvm-8/bin

CC=$(LLVM_BIN)/clang
CFLAGS=-O0 --target=wasm32 -c
LD=$(LLVM_BIN)/wasm-ld
LDFLAGS=--no-entry --allow-undefined --export=foo

all: index.wasm

bar.o: bar.c Makefile
	$(CC) $(CFLAGS) -o $@ $<

foo.o: foo.c Makefile
	$(CC) -gfull $(CFLAGS) -o $@ $<

index.wasm: bar.o foo.o Makefile
	$(LD) $(LDFLAGS) -o $@ $(filter %.o,$^)

start: all
	python3 -m http.server 4000

clean:
	@rm -f *.o *.wasm
