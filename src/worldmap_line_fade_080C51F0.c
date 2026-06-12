#include "global.h"

#include "hardware.h"
#include "spline.h"
#include "sysutil.h"

#include "worldmap.h"

struct GmapLineFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
};

extern u8 gWmHblankStatus;

//! FE8U = 0x080C040C
void GmapLineFade_Init(struct GmapLineFadeProc * proc)
{
#ifndef NONMATCHING
    int size = 0x010000A0;
#endif

    if (proc->unk_29 == 2)
    {
        NewFadeIn(1, 0);
        proc->unk_2c = 100;
    }
    else
    {
        NewFadeIn(2, 0);
        proc->unk_2c = 50;
    }

    proc->unk_2a = 0;

#ifdef NONMATCHING
    CpuFill16(0x10, GetWorldMapHblankBuffer(0, 0), 0x140);
#else
    {
        vu16 tmp = (vu16)0x10;
        CpuSet((void *)(&tmp), GetWorldMapHblankBuffer(0, 0), size);
    }
#endif

    SetWorldMapHblankDest(0, 0x04000054);
    ClearWorldMapHblankChannelFlags(0);

    SetBlendConfig(BLEND_EFFECT_DARKEN, 16, 16, 16);

    SetDispEnable(0, 1, 1, 1, 1);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 0, 0, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    gWmHblankStatus |= 4;

    return;
}
