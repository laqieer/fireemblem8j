#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

void DrawStatBarFilledCol(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 1;
    buf[2 * bufWidth + col] = 5;
}
