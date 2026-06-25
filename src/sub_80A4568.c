#include "global.h"
#include "proc.h"
#include "cgtext.h"

// JP-only augury (占い) screen text-flag updater. Field offset from gbadisasm oracle.
struct Augury80A4568Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2C;
};

int sub_80A2C78(void);
void sub_80913FC(int a, int b, int c, int d, int e, void * f, int g, int h);

void sub_80A4568(struct Augury80A4568Proc * proc)
{
    proc->unk_2C = sub_80A2C78();
    sub_80913FC(0x16, 0x10, -1, -1, proc->unk_2C, (void *)0x06011000 /* VRAM */, -1, 0);
    SetCgTextFlags(GetCgTextFlags() | 0x0004004E);
}
