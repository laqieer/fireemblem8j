#include "global.h"
#include "worldmap.h"

//! FE8U = 0x080C0834
int GetWMPointDistance(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    int a = (arg2 - arg0);
    int b = (arg3 - arg1);

    return Sqrt((a * a + b * b) << (arg4));
}
