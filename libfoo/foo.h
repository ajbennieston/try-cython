#pragma once

int foo_square(int x);
int foo_cube(int x);

typedef int (*callback_type)(void*, int);

int do_something(callback_type callback, void* user_data, int x);

int set_callback(callback_type callback, void* user_data);

void reset_callback(void);

int do_another_thing(int x);

