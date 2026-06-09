#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

void DrawStatBarCappedCol(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 13;
    buf[2 * bufWidth + col] = 12;
}
