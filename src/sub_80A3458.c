#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"
#include "sysutil.h"
#include "variables.h"

// JP-only augury (占い) screen-init proc. Field offsets from gbadisasm oracle.
struct Augury80A3458Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2C;
    /* 30 */ STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 unk_34[5];
    /* 39 */ STRUCT_PAD(0x39, 0x3C);
    /* 3C */ u8 unk_3C;
    /* 3D */ u8 unk_3D;
    /* 3E */ u8 unk_3E;
    /* 3F */ STRUCT_PAD(0x3F, 0x52);
    /* 52 */ s16 unk_52;
    /* 54 */ s16 unk_54;
    /* 56 */ STRUCT_PAD(0x56, 0x5C);
    /* 5C */ s16 unk_5C;
    /* 5E */ s16 unk_5E;
};

// JP-only augury graphics in ROM.
extern u8 gAuguryTiles_8A9A39C[];
extern u8 gAuguryPal_8A9A4E4[];

// Byte overlay of gPlaySt for the +0x40 config-byte RMW.
struct PlayStBytes41 { s8 b[0x42]; };
extern struct PlayStBytes41 gPlayStBytes40;

void sub_80A3300(ProcPtr proc);
void sub_80048B4(ProcPtr proc);

void sub_80A3458(struct Augury80A3458Proc * proc)
{
    int i;

    proc->unk_3C = 0;
    proc->unk_3D = 0;
    proc->unk_3E = 0;
    proc->unk_52 = 0;
    proc->unk_54 = 0;
    proc->unk_5C = 0;
    proc->unk_5E = 0;

    for (i = 0; i <= 4; i++)
        proc->unk_34[i] |= 0xFF;

    proc->unk_2C = 0;

    Decompress(gAuguryTiles_8A9A39C, (void *)0x06017000 /* VRAM */);
    CopyToPaletteBuffer(gAuguryPal_8A9A4E4, 0x3E0, 0x20);

    gPlayStBytes40.b[0x40] = (gPlayStBytes40.b[0x40] & ~0x60) | 0x20;

    StartParallelWorker(sub_80A3300, proc);
    sub_80048B4(proc);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
}
