#include "global.h"

#include "proc.h"
#include "savemenu.h"

extern const int SaveMenuSubSelBoxTexts[];

//! FE8U = 0x080ABBB0
void StartSqMask(struct SaveMenuProc * parent, int b, int c)
{
    s8 castB = b;
    u8 castC = c;

    struct SqMaskProc* proc = Proc_StartBlocking((const struct ProcCmd *)((u8 *)SaveMenuSubSelBoxTexts + 0x1C), parent);
    proc->unk_2a = castB;
    proc->unk_2b = castC;

    proc->unk_29 = 0;

    return;
}
