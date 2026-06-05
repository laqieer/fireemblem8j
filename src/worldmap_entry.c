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

//! FE8U = 0x080BF7B4
void RememberBlendState(struct BlendStruct * blend)
{
    blend->blendCnt = gLCDControlBuffer.bldcnt;
    blend->blendCoeffA = gLCDControlBuffer.blendCoeffA;
    blend->blendCoeffB = gLCDControlBuffer.blendCoeffB;
    blend->blendY = gLCDControlBuffer.blendY;

    return;
}

//! FE8U = 0x080BF7DC
void RestoreBlendState(struct BlendStruct * blend)
{
    gLCDControlBuffer.bldcnt = blend->blendCnt;
    gLCDControlBuffer.blendCoeffA = blend->blendCoeffA;
    gLCDControlBuffer.blendCoeffB = blend->blendCoeffB;
    gLCDControlBuffer.blendY = blend->blendY;

    return;
}

//! FE8U = 0x080BF804
void GmapBaseEntry_OnEnd(struct GmapBaseEntryProc * proc)
{
    GM_ICON->unk_34[(proc->unk_29 / 0x20)] &= ~(1 << (proc->unk_29 % 0x20));
    EnablePaletteSync();

    gGMData.nodes[proc->unk_29].state |= 1;

    if ((gGMData.nodes[proc->unk_29].state & 2) != 0)
    {
        GM_ICON->nodeId = proc->unk_29;
        GM_ICON->merge_next_node = true;
    }

    EndGmapEffect();
    RestoreBlendState(&proc->unk_30);

    return;
}

//! FE8U = 0x080BF890
void GmapBaseEntry_Init(struct GmapBaseEntryProc * proc)
{
    RememberBlendState(&proc->unk_30);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}
