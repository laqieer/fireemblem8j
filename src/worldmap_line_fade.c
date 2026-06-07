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

//! FE8U = 0x080C0308
void GmapLineFade_OnEnd(void)
{
    gWmHblankStatus &= ~4;

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}
