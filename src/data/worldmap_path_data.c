#include "global.h"

#include "worldmap.h"

/* World-map node-to-node movement path tables (gWorldmapPath_0..19).
 *
 * Each entry is a { elapsedTime, x, y } keyframe for the animated route the
 * gmap sprite walks between two adjacent nodes; a { -1 } entry terminates the
 * list. Pure region-same coordinate data (no text, no region-different
 * pointers), so this transcribes byte-identically from the JP ROM through the
 * fe8u GMapMovementPathData layout. Together the 20 tables fill the contiguous
 * block JP 0x081f6188..0x081f6340 (US 0x082064bc, shift -0x10334), upgrading
 * the former dat_worldmap_gmapunit_p2 incbin carve to typed C.
 *
 * gWMPathData (which references these via .movementPath) stays region-different
 * (incbin) because its gfxData pointers resolve to JP-shifted gWorldmapSprite_*.
 */

// clang-format off

const struct GMapMovementPathData CONST_DATA gWorldmapPath_0[] =
{
    { 1351, 128, 88, },
    { 2703, 112, 72, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_1[] =
{
    { 2990, 120, 104, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_2[] =
{
    { 2048, 184, 184, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_3[] =
{
    { 2048, 184, 216, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_4[] =
{
    { 819, 168, 88, },
    { 3276, 200, 56, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_5[] =
{
    { 1474, 288, 104, },
    { 3563, 312, 128, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_6[] =
{
    { 1064, 72, 88, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_7[] =
{
    { 1638, 72, 192, },
    { 2580, 56, 208, },
    { 3276, 56, 224, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_8[] =
{
    { 1720, 104, 232, },
    { 2949, 120, 248, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_9[] =
{
    { 573, 160, 248, },
    { 2293, 176, 264, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_10[] =
{
    { 983, 288, 264, },
    { 2416, 312, 240, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_11[] =
{
    { 1187, 240, 216, },
    { 2867, 264, 240, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_12[] =
{
    { 1884, 256, 200, },
    { 3809, 216, 160, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_13[] =
{
    { 901, 152, 112, },
    { 3153, 192, 152, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_14[] =
{
    { 2457, 360, 200, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_15[] =
{
    { 303, 392, 80, },
    { 733, 384, 72, },
    { 2260, 344, 72, },
    { 2871, 344, 88, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_16[] =
{
    { 901, 408, 104, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_17[] =
{
    { 2048, 392, 40, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_18[] =
{
    { 942, 248, 56, },
    { 1638, 264, 40, },
    { -1, },
};

const struct GMapMovementPathData CONST_DATA gWorldmapPath_19[] =
{
    { 1351, 344, 88, },
    { -1, },
};
