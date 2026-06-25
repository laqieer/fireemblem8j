#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "functions.h"

struct Proc80A2DF8
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ u16 unk4C;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk58;
};

extern u16 gPal_A9A4E4[];

void sub_80A2DF8(struct Proc80A2DF8* proc)
{
    int index;
    u16 frame;

    proc->unk4C++;

    frame = proc->unk4C;

    if ((frame & 3) == 0)
    {
        index = (s16)proc->unk4C / 4;

        CpuFastSet(gPal_A9A4E4 + index * 0x10, gPaletteBuffer + 0x100 + proc->unk58 * 0x10, 8);
        EnablePaletteSync();

        if (index == 5)
            Proc_Break(proc);
    }
}
