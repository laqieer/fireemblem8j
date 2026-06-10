#include "global.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"
#include "worldmap.h"
#include "constants/songs.h"

extern const struct Vec2 gWmSkirmish_PositionsA[];
struct GmapTmConfrontProc { PROC_HEADER; u16 unk_2a; u16 unk_2c; u8 unk_2e[2]; struct Vec2 unk_30[2]; struct Vec2 unk_38[2]; struct Vec2 unk_40[2]; void * unk_48; };
void GmTmConfront_LoadPositions(struct GmapTmConfrontProc * proc, const struct Vec2 * posArray);

// clang-format on

//! FE8U = 0x080C05AC
void GmTmConfront_InitUnitPositionA(struct GmapTmConfrontProc * proc)
{
    GmTmConfront_LoadPositions(proc, gWmSkirmish_PositionsA);
    proc->unk_2c = 16;
    return;
}
