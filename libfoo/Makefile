.PHONY: all clean

CC := clang
CFLAGS := -std=c11 -fPIC -O3

all:
	$(CC) $(CFLAGS) -c -o foo.o foo.c
	$(CC) $(CFLAGS) -shared -o libfoo.dylib foo.o
	$(CC) $(CFLAGS) -c -o test_foo.o test_foo.c
	$(CC) $(CFLAGS) -o test_foo test_foo.o -L. -lfoo

clean:
	rm -f libfoo.dylib foo.o test_foo test_foo.o
