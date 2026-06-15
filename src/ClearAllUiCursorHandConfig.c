#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"

struct CursorHandProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3c);
    /* 3C */ u8 flags[8];
};

extern struct ProcCmd gProcScr_UiCursorHand[];

void ClearAllUiCursorHandConfig(void)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        int i;

        for (i = 0; i < 8; i++)
        {
            proc->flags[i] = 0;
        }
    }
}
