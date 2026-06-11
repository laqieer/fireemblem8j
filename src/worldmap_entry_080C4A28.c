#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"

#include "worldmap.h"
#include "constants/songs.h"

struct BlendStruct
{
    /* 00 */ struct BlendCnt blendCnt;
    /* 08 */ u8 blendCoeffA;
    /* 09 */ u8 blendCoeffB;
    /* 0A */ u8 blendY;
};

struct GmapBaseEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 30 */ struct BlendStruct unk_30;
};

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

extern u8 gWmHblankStatus;

extern u16 gPal_WorldmapMinimap_0[];
extern u8 gImg_WorldmapMinimap_0[];
extern u8 gTsa_WorldmapMinimap_0[];

//! FE8U = 0x080BFC44
void GmapMuEntry_1(struct GmapBaseEntryProc * proc)
{
    proc->unk_2c--;

    if (proc->unk_2c > 0)
    {
        return;
    }

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2d++;
            break;

        case 1:
            proc->unk_2d += 2;
            break;
    }

    if (proc->unk_2d < 0x10)
    {
        SetBlendConfig(BLEND_EFFECT_NONE, proc->unk_2d, 0x10 - proc->unk_2d, 0);
        proc->unk_2c = proc->unk_2b;
    }
    else
    {
        GmMu_SetBlendEnabled(GM_MU, proc->unk_29, 0);
        Proc_Break(proc);
    }

    return;
}
