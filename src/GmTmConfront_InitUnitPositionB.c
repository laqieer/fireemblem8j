extern int GmTmConfront_LoadPositions();
#include "global.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const struct Vec2 gWmSkirmish_PositionsB[];

struct GmapTmConfrontProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e[2];
    /* 30 */ struct Vec2 unk_30[2];
    /* 38 */ struct Vec2 unk_38[2];
    /* 42 */ struct Vec2 unk_40[2];
    /* 48 */ void * unk_48;
};

// clang-format on

//! FE8U = 0x080C05C4
void GmTmConfront_InitUnitPositionB(struct GmapTmConfrontProc * proc)
{
    GmTmConfront_LoadPositions(proc, gWmSkirmish_PositionsB);
    proc->unk_2c = 5;
    PlaySoundEffect(SONG_313);
    return;
}
