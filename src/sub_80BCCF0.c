#include "global.h"
#include "bmlib.h"

struct Proc80BCCF0
{
    /* 00 */ STRUCT_PAD(0x00, 0x58);
    /* 58 */ int unk58;
};

void sub_80BCCF0(struct Proc80BCCF0 * proc)
{
    ArchivePalette(proc->unk58 + 0x10);

    StartMapPaletteBrightnessFade(0x100, 0x100, 0x100, 0x200, 0x200, 0x200,
                                  1 << (proc->unk58 + 0x10), 0x10, proc);
}
