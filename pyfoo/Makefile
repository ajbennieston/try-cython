.PHONY: all build clean test

all: build

build:
	$(MAKE) -C ../libfoo/
	cp ../libfoo/libfoo.dylib .
	python setup.py build_ext --inplace

clean:
	rm -f pyfoo.so pyfoo.c
	rm -rf build
	rm -f libfoo.dylib
	$(MAKE) -C ../libfoo/ clean

test:
	python test_prog.py
