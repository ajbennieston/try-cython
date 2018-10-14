from distutils.core import setup, Extension
from Cython.Build import cythonize

ext = Extension('pyfoo',
                include_dirs=['../libfoo'],
                libraries=['foo'],
                library_dirs=['../libfoo'],
                sources=['pyfoo.pyx'])
setup(ext_modules=cythonize(ext))
