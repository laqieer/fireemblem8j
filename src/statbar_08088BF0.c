#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

/* These should related to status-bar gfx for stat-screen */

void UnusedDrawOutline(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}
