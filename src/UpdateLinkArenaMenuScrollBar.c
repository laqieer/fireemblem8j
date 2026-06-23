#include "global.h"
#include "sio.h"

//! FE8U = 0x0804D24C
void UpdateLinkArenaMenuScrollBar(u8 a, s16 b)
{
    struct LAMenuScrollBarProc * proc = Proc_Find(ProcScr_LinkArenaMenuScrollBar);

    if (proc == NULL)
    {
        return;
    }

    proc->unk_3c = a;
    proc->unk_3e = b & 0xff;
    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}
