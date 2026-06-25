#include "global.h"
#include "proc.h"
#include "cgtext.h"

struct Proc80A43A0
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk2C;
};

extern int GetChapterDivinationTextIdBeginning(void);

void sub_80A43A0(struct Proc80A43A0* proc)
{
    int h = GetChapterDivinationTextIdBeginning();

    proc->unk2C = h;

    StartCgText(0x16, 0x10, -1, -1, h, (void*)0x06011000, -1, 0);
    SetCgTextFlags(GetCgTextFlags() | 0x0004004E);
}
