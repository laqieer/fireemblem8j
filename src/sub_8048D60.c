#include "global.h"

// Region-different: checks the leading magic byte.
int sub_8048D60(u8 *p)
{
    if (*p == 0x66)
        return 1;
    else
        return 0;
}
