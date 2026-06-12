#include "global.h"
#include "gbafe.h"

/**
 * buf[0] = val % 100
 * buf[1] = (val - [val]) % 10
 * buf[1] = (val - [val]) % 1
 * 
 * example:
 * in 312, out 3, 1, 2
 * 
 * in 458, out 4, 5, 8
 */
void ModDec(s16 val, u16 buf[])
{
    if (val == -1) {
        buf[0] = 11;
        buf[1] = 10;
        buf[2] = 10;
        return;
    }

    buf[0] = Div(val, 100);

    val -= buf[0] * 100;
    buf[1] = Div(val, 10);

    val -= buf[1] * 10;
    buf[2] = val;

    if (buf[0] == -buf[1])
        buf[1] = 11;

    if (buf[0] == 0)
        buf[0] = 11;
}
