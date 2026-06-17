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

void GmapBaseEntry_0(struct GmapBaseEntryProc * proc)
{
    gGMData.nodes[proc->unk_29].state |= 1;

    GM_ICON->unk_34[(proc->unk_29 / 0x20)] |= (1 << (proc->unk_29 % 0x20));

    if ((gGMData.nodes[proc->unk_29].state & 2) != 0)
    {
        GM_ICON->nodeId = proc->unk_29;
        GM_ICON->merge_next_node = true;
    }

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2b = 2;
            break;

        case 1:
            proc->unk_2b = 1;
            break;
    }

    proc->unk_2c = proc->unk_2b;
    proc->unk_2d = 0;

    return;
}
