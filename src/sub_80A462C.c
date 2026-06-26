#include "global.h"
#include "proc.h"
#include "cgtext.h"

/* JP-only augury (占い) CG/illustration text init, sibling of sub_80A43E4/sub_80A4568.
 * The IsDivinationPortrait1() predicate is read but the stored handle is the
 * constant 0x7B1 on either branch (the JP build folds the branch, keeping the
 * dead s8-normalization of the predicate result). */

struct Unk80A462CProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
};

s8 IsDivinationPortrait1(void);
void sub_80913FC(int a, int b, int c, int d, int e, void * f, int g, int h);

void sub_80A462C(struct Unk80A462CProc * proc)
{
    if (IsDivinationPortrait1())
    {
        proc->unk2C = 0x7B1;
    }
    else
    {
        proc->unk2C = 0x7B1;
    }

    sub_80913FC(0x16, 0x10, -1, -1, proc->unk2C, (void *)0x06011000 /* VRAM */, -1, 0);

    SetCgTextFlags(GetCgTextFlags() | 0x0004004E);
}
