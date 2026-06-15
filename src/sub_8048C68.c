#include "global.h"

// Region-different: checks the leading magic byte.
int sub_8048C68(u8 *p)
{
    if (*p == 0x55)
        return 1;
    else
        return 0;
}
