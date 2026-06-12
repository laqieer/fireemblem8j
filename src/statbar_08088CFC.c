#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

/* prototypes for same-file helpers called by this run */
void DrawStatBarLeftBorder(u8 *buf, int bufWidth, int col);
void DrawStatBarShadow(u8 *buf, int bufWidth, int col);
void DrawStatBarRightBorder(u8 *buf, int bufWidth, int col);
void DrawStatBarUnfilledCol(u8 *buf, int bufWidth, int col);
void DrawStatBarFilledCol(u8 *buf, int bufWidth, int col);
void DrawStatBarCappedCol(u8 *buf, int bufWidth, int col);

void DrawStatBar(
    int tile, int padding, int bufWidth, int barWidth, int progressLength, int cappedLength)
{
    int i, j, val, val1;
    u8 *buf = gGenericBuffer;
    CpuFastFill(0, buf, 0x40 * bufWidth);

    for (i = 1; i < barWidth + 1; i++)
        DrawStatBarUnfilledCol(buf, 8 * bufWidth, i + ({padding + 1;}));

    DrawStatBarLeftBorder(buf, 8 * bufWidth, padding + 1);
    DrawStatBarRightBorder(buf, 8 * bufWidth, padding + barWidth + 2);
    DrawStatBarShadow(buf, 8 * bufWidth, padding + barWidth + 3);

    for (i = 0; i < progressLength; i++)
        DrawStatBarFilledCol(buf, 8 * bufWidth, i + ({padding + 2;}));

    for (i = 0; i < cappedLength; i++)
        DrawStatBarCappedCol(buf, 8 * bufWidth, i + progressLength + padding + 2);

    ApplyBitmap(buf, (void*)(32 * tile + VRAM), bufWidth, 1);
}
