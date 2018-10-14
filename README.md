# What is this?

This repository holds some test code for playing with Cython to wrap a C library with callbacks in Python.

# How do I build it?
Enter a Python environment with the `cython` package installed:
```bash
conda create -n cython-env cython ipython
source activate cython-env
```

Then build the extension module using the command below, which will trigger the C library build as well:
```bash
cd pyfoo
make
```

Run the test script either with 
```bash
make test
```

or
```bash
python test_prog.py
```
