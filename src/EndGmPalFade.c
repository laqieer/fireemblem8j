#include "global.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapPalFade[];

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

//! FE8U = 0x080BF748
void EndGmPalFade(void)
{
    struct GmapPalFadeProc * proc = Proc_Find(ProcScr_GmapPalFade);
    if (proc)
    {
        CpuCopy16(proc->unk_3c, gPaletteBuffer + proc->unk_35, proc->unk_34 * 2);

        EnablePaletteSync();

        Proc_EndEach(ProcScr_GmapPalFade);
    }

    return;
}
