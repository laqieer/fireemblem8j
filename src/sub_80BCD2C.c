#include "global.h"
#include "bmlib.h"

struct Proc80BCD2C
{
    /* 00 */ STRUCT_PAD(0x00, 0x58);
    /* 58 */ int unk58;
};

void sub_80BCD2C(struct Proc80BCD2C * proc)
{
    StartMapPaletteBrightnessFade(0x200, 0x200, 0x200, 0x100, 0x100, 0x100,
                                  1 << (proc->unk58 + 0x10), 0x10, proc);
}
