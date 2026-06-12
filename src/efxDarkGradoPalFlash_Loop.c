#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

struct Proc085D84B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

#define RGB_(r, g, b) (((b) << 10) | ((g) << 5) | (r))

//! FE8U = 0x08069530
void efxDarkGradoPalFlash_Loop(struct Proc085D84B4 * param_1)
{
    u16 r1;
    int r6;
    u16 * r8, * r9;
    int sp_0c = 0; // redundant initialization
    int sp_18;

    r9 = gPaletteBuffer;
    r8 = gEfxPal;

    if (param_1->unk4C > 0x28)
        r6 = Interpolate(0, 0x10, 0, param_1->unk4C - 0x28, 0x18);
    else if (param_1->unk4C > 0x18)
        r6 = 0x10;
    else
        r6 = Interpolate(0, 0, 0x10, param_1->unk4C, 0x18);

    *r8 = *r9;

    for (sp_0c = 0; sp_0c < 0x20; sp_0c++)
    {
        switch (sp_0c) {
            case 1:
            case 2:
            case 3:
            case 16:
            case 21:
            case 22:
            case 27:
            case 28:
            case 29:
            case 30:
                r1 = 0x00007C1F;
                break;

            default:
                r1 = 0;
                break;
        }

        r9++;
        r8++;

        for (sp_18 = 0; sp_18 < 0xF; sp_18++)
        {
            u8 r = ((*r9 & 0x1f) * (0x10 - r6) + ((r1 & 0x1f) * r6)) >> 4;
            u8 g = (((*r9 >> 5) & 0x1f) * (0x10 - r6) + (((r1 >> 5) & 0x1f) * r6)) >> 4; // ((r1 >> 5) & 0x1f) == 0 given the two colors
            u8 b = (((*r9 >> 10) & 0x1f) * (0x10 - r6) + (((r1 >> 10) & 0x1f) * r6)) >> 4;

            *r8 = RGB_(r & 0x1f, g & 0x1f, b & 0x1f);
            r9++;
            r8++;
        }
    }

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);
    DisablePaletteSync();

    if (param_1->unk4C == 0x40)
        Proc_Break(param_1);

    param_1->unk4C++;

    return;
}
