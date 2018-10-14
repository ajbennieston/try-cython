cimport cpython.ref

cdef extern from "foo.h":
    int foo_square(int x)
    int foo_cube(int x)
    ctypedef int (*callback_type)(void*, int)
    int do_something(callback_type callback, void* user_data, int x)
    int set_callback(callback_type callback, void* user_data)
    void reset_callback()
    int do_another_thing(int x)

cdef int callback_wrapper(void* user_data, int x):
    return (<object>user_data)(x)

cdef class MathOps(object):
    cdef readonly int _x
    cdef object _func

    def __init__(self, x):
        self._x = x
        self._func = None

    def square(self):
        """
        Returns the square of the integer x
        """
        return foo_square(self._x)

    def cube(self):
        """
        Returns the cube of the integer x
        """
        return foo_cube(self._x)
    
    def general_op(self, func):
        return do_something(callback_wrapper, <void*>func, self._x)

    def register_callback(self, func):
        # Need to keep a reference to the object in Python, so it's not
        # garbage collected...
        self._func = func
        return set_callback(callback_wrapper, <void*>(self._func))

    def do_call(self):
        return do_another_thing(self._x)

    def unset_callback(self):
        reset_callback()
        self._func = None

    def __del__(self):
        reset_callback()

