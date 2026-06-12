extern int GmMuEntry_SetupHblankGradient();
#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/songs.h"

struct GmapMuEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 flags_0 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s16 unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

//! FE8U = 0x080C0080
void GmMuEntry_2(struct GmapMuEntryProc * proc)
{
    int unk;

    proc->unk_38 += 0x1000;

    if (proc->unk_38 < proc->unk_34)
    {
        unk = _DivArm1(proc->unk_38, proc->unk_34, proc->unk_30);

        proc->unk_2a = proc->unk_2c + DivArm(0x1000, proc->unk_3c * unk);
        proc->unk_2b = proc->unk_2e + DivArm(0x1000, proc->unk_40 * unk);

        SetBlendAlpha(unk / 256, 0x10 - (unk / 256));
    }
    else
    {
        SetWorldMapHblankDest(0, 0);
        unk = 0x1000;
        SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
        proc->unk_2a = proc->unk_2d;
        proc->unk_2b = proc->unk_2f;
        proc->flags_0 = 0;

        Proc_Goto(proc, 0);
    }

    GmMuEntry_SetupHblankGradient(proc, unk);

    return;
}
