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

/* prototypes for same-file helpers called by this run */
void LoadWorldmapMinimap(void);

//! FE8U = 0x080BFDA0
void GmMuEntry_SetupHblankGradient(struct GmapMuEntryProc * proc, int unused)
{
    int r;
    int g;
    int b;

    int i;
    int j;

    u16 * palA = GetWorldMapHblankBuffer(0, 1);
    u16 * palB = GetWorldMapHblankBuffer(1, 1);

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        palA[i] = (0x40 - i) & 0x1FF;
        palB[i] = 0;
    }

    for (i = 0; i < proc->unk_2a; i++)
    {
        palA[i] = 0x10 - proc->unk_2a;

        r = ((proc->unk_2a - i) * -6 / proc->unk_2a) + 13;
        g = ((proc->unk_2a - i) * -10 / proc->unk_2a) + 17;
        b = ((proc->unk_2a - i) * -7 / proc->unk_2a) + 23;
        palB[i] = (b << 10) + (g << 5) + r;
    }

    for (i = 0; i < proc->unk_2b; i++)
    {
        j = DISPLAY_HEIGHT - (proc->unk_2b - i);
        palA[j] = proc->unk_2b + 200;

        r = (i * -6 / proc->unk_2b) + 13;
        g = (i * -10 / proc->unk_2b) + 17;
        b = (i * -7 / proc->unk_2b) + 23;
        palB[j] = (b << 10) + (g << 5) + r;
    }

    FlipWorldMapHblankBuffer();

    return;
}

//! FE8U = 0x080BFEF8
void GmMuEntry_0(struct GmapMuEntryProc * proc)
{
    u16 * buf;
    LoadWorldmapMinimap();

    proc->unk_38 = 0;
    proc->unk_2a = proc->unk_2c;
    proc->unk_2b = proc->unk_2e;
    proc->unk_3c = proc->unk_2d - proc->unk_2c;
    proc->unk_40 = proc->unk_2f - proc->unk_2e;

    buf = GetWorldMapHblankBuffer(0, 1);
    CpuFill16(0x10, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(0, 0x04000012);
    ClearWorldMapHblankChannelFlags(0);

    buf = GetWorldMapHblankBuffer(1, 1);
    CpuFill16(0, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(1, 0x05000054);
    ClearWorldMapHblankChannelFlags(1);

    gWmHblankStatus |= 4;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    SetBlendAlpha(0, 0x10);

    return;
}

//! FE8U = 0x080BFFD0
void GmMuEntry_1(struct GmapMuEntryProc * proc)
{
    u16 * buf;
    LoadWorldmapMinimap();

    proc->unk_38 = 0;

    proc->unk_2a = proc->unk_2c;
    proc->unk_2b = proc->unk_2e;
    proc->unk_3c = proc->unk_2d - proc->unk_2c;
    proc->unk_40 = proc->unk_2f - proc->unk_2e;

    buf = GetWorldMapHblankBuffer(0, 1);
    CpuFill16(0x10, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(0, 0x04000012);
    ClearWorldMapHblankChannelFlags(0);

    buf = GetWorldMapHblankBuffer(1, 1);
    CpuFill16(0, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(1, 0x05000054);
    ClearWorldMapHblankChannelFlags(1);

    gWmHblankStatus |= 4;

    return;
}
