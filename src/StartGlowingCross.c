#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"


struct Proc89A448C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
};
struct MAEffectSummonProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ u8 unk_38;
    /* 3A */ STRUCT_PAD(0x3a, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 unk_4a;
    /* 4C */ STRUCT_PAD(0x4c, 0x50);
    /* 50 */ struct MAEffectSummonProc * unk_50;
};
struct Pair
{
    s8 x;
    s8 y;
};

void StartGlowingCross(ProcPtr parent, struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_GlowingCross, parent);

    proc->unit = unit;
    proc->xDisplay = (((unit->xPos - (gBmSt.camera.x >> 4)) * 2) + 1) * 8;
    proc->yDisplay = (((unit->yPos - (gBmSt.camera.y >> 4)) * 2) + 1) * 8;

    return;
}
