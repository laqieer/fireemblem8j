#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"

struct CursorHandProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3c);
    /* 3C */ u8 flags[4];
};

extern struct ProcCmd gProcScr_UiCursorHand[];

void ClearUiCursorHandConfig(u32 index)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        proc->flags[index] = 0;
    }
}
