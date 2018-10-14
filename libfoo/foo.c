#include "foo.h"

#include <stdio.h>

int foo_square(int x)
{
    return x * x;
}

int foo_cube(int x)
{
    return x * x * x;
}

int do_something(callback_type callback, void* user_data, int x)
{
    return callback(user_data, x);
}

struct callback_info {
    callback_type callback;
    void* user_data;
};

static struct callback_info global_callback = {NULL, NULL};

int set_callback(callback_type callback, void* user_data)
{
    if (global_callback.callback != NULL) return -1;

    global_callback.callback = callback;
    global_callback.user_data = user_data;
    return 0;
}

void reset_callback(void)
{
    global_callback.callback = NULL;
    global_callback.user_data = NULL;
}

int do_another_thing(int x)
{
    if (global_callback.callback == NULL)
        return -1;

    return global_callback.callback(global_callback.user_data, x);
}

