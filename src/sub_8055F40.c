#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "gba/syscall.h"

extern const u8 gUnk_080DFD46[];
extern const u8 gUnk_085E3CD4[];
extern const u8 gGfx_0878F150[];
extern const u8 gPal_08794944[];

struct ProcGfxLoad
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 state;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 _2c;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ int _44;
    /* 48 */ const u8 *_48;
    /* 4C */ const u8 *_4c;
};

// JP-only proc step: when state == 1, init fields, decompress gfx to VRAM, copy
// palette, then break the proc.
void sub_8055F40(struct ProcGfxLoad *proc)
{
    if (proc->state == 1)
    {
        proc->_2c = 0;
        proc->_44 = 0;
        proc->_48 = gUnk_080DFD46;
        proc->_4c = gUnk_085E3CD4;

        LZ77UnCompVram(gGfx_0878F150, (void *)(0x06008000));
        CpuFastSet(gPal_08794944, (void *)(0x02022968), 8);

        Proc_Break(proc);
    }
}
