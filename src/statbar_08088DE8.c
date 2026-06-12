#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

/* prototypes for same-file helpers called by this run */
void DrawStatBar( int tile, int padding, int bufWidth, int barWidth, int progressLength, int cappedLength);
void DrawStatBarGfx( int tile, int bufWidth, u16* buf, int tileBase, int barWidth, int progressLength, int cappedLength);

// bufWidth: The width of the allocated buffer canvas
// barWidth: The width of the bar itself (in tiles)
// progressLength: The length of the "progress" of the bar (the yellow part)
// cappedLength: Same as above, controls the part that flashes green when stat capped
void DrawStatBarGfx(
    int tile, int bufWidth, u16* buf, int tileBase,
    int barWidth, int progressLength, int cappedLength)
{
    DrawStatBar(tile, 2, bufWidth, barWidth, progressLength, cappedLength);
    PutAppliedBitmap(buf, tileBase + (tile & 0x3FF), bufWidth, 1);
}
