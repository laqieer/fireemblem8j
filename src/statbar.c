#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

void DrawStatBarLeftBorder(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
}

void DrawStatBarShadow(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarRightBorder(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarUnfilledCol(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 14;
    buf[2 * bufWidth + col] = 3;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}
