.PHONY: default clean

default: out/demo

CFLAGS = \
	-std=c2x \
	-O2 \
	-Wall \
	-Wconversion \
	-Wdouble-promotion \
	-Werror \
	-Weverything \
	-Wextra \
	-Wno-c++98-compat \
	-Wno-constant-logical-operand \
	-Wno-declaration-after-statement \
	-Wno-fixed-enum-extension \
	-Wno-gnu-statement-expression-from-macro-expansion \
	-Wno-missing-prototypes \
	-Wno-pre-c2x-compat \
	-Wno-shadow \
	-Wno-shift-op-parentheses \
	-Wno-unsafe-buffer-usage \
	-ffp-contract=off \
	-fno-math-errno \
	-fno-omit-frame-pointer \
	-fno-slp-vectorize \
	-pedantic

clean:
	rm -f out/*

out/sieve.o: src/sieve.c src/sieve.h
	clang -o $@ -c src/sieve.c $(CFLAGS) -DNDEBUG

out/demo: src/demo.c out/sieve.o
	clang -o $@ src/demo.c out/sieve.o $(CFLAGS) -DNDEBUG
