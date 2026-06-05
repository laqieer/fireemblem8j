#include "global.h"

#include "hardware.h"

#include "worldmap.h"

struct GmapPalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 38 */ u16 * unk_38;
    /* 3C */ u16 * unk_3c;
    /* 40 */ u16 * unk_40;
};

struct GmPalFadeInput
{
    /* 00 */ u16 * unk_00;
    /* 04 */ u16 * unk_04;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0C */ int unk_0c;
};

extern u16 gWorldmapGmap_2[];
extern u16 gWorldmapGmap_1[];

//! FE8U = 0x080BF5C4
void GmPalFade_Init(struct GmapPalFadeProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_40 = gPaletteBuffer + proc->unk_35;
    return;
}

//! FE8U = 0x080BF5DC
void GmPalFade_Loop(struct GmapPalFadeProc * proc)
{
    int i;

    proc->unk_30++;

    if (proc->unk_30 < proc->unk_2c)
    {
        int scale = proc->unk_30 * 0x40 / proc->unk_2c;
        u16 red, green, blue;
        s32 v38, v3c;

        for (i = 0; i < proc->unk_34; i++)
        {
            v38 = RED_VALUE(proc->unk_38[i]);
            v3c = RED_VALUE(proc->unk_3c[i]);
            red = v38 + ((v3c - v38) * scale / 0x40);
            v38 = GREEN_VALUE(proc->unk_38[i]);
            v3c = GREEN_VALUE(proc->unk_3c[i]);
            green = v38 + ((v3c - v38) * scale / 0x40);
            v38 = BLUE_VALUE(proc->unk_38[i]);
            v3c = BLUE_VALUE(proc->unk_3c[i]);
            blue = v38 + ((v3c - v38) * scale / 0x40);

            proc->unk_40[i] = (blue << 10) + (green << 5) + red;
        }
    }
    else
    {
        CpuCopy16(proc->unk_3c, proc->unk_40, proc->unk_34 * 2);
        Proc_Break(proc);
    }

    EnablePaletteSync();

    return;
}
