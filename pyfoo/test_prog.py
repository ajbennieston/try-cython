import pyfoo

m = pyfoo.MathOps(3)

# Test simple calls
print m.square(), 9
print m.cube(), 27

# Test callback
def quad(x):
    return x**4

print m.general_op(quad), 81

# Test persistent callback as lambda
m.register_callback(lambda x: (x + 1) / 2)
print m.do_call(), 2

# Test error handling
m.unset_callback()
print m.do_call(), -1

# Test persistent callback as function object
class SomeCallableType(object):
    def __init__(self, y):
        self._y = y

    def __call__(self, x):
        return x * self._y

func = SomeCallableType(4)
m.register_callback(func)
print m.do_call(), 12

# Test persistent callback as plain function
m.unset_callback()
m.register_callback(quad)
print m.do_call(), 3**4
