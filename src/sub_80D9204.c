#include "global.h"

extern u8 data_08577444[];

void * _localeconv_r(void * reent)
{
    return (void *)data_08577444;
}
