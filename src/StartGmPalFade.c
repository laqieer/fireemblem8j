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
struct GmPalFadeInput
{
    /* 00 */ u16 * unk_00;
    /* 04 */ u16 * unk_04;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0C */ int unk_0c;
};

// clang-format on

//! FE8U = 0x080BF6C0
ProcPtr StartGmPalFade(ProcPtr parent, struct GmPalFadeInput * input)
{
    if (input->unk_0c >= 1)
    {
        struct GmapPalFadeProc * proc;
        if (parent)
        {
            proc = Proc_StartBlocking(ProcScr_GmapPalFade, parent);
        }
        else
        {
            proc = Proc_Start(ProcScr_GmapPalFade, PROC_TREE_3);
        }

        proc->unk_2c = input->unk_0c;
        proc->unk_34 = input->unk_08;
        proc->unk_35 = input->unk_09;
        proc->unk_38 = input->unk_00;
        proc->unk_3c = input->unk_04;

        return proc;
    }

    CpuCopy16(input->unk_04, gPaletteBuffer + input->unk_09, input->unk_08 * 2);
    EnablePaletteSync();

    return NULL;
}
