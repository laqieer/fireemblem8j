#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"

extern struct ProcCmd gProcScr_UiCursorHand[];

void BlockUiCursorHand(void)
{
    ProcPtr proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        Proc_Goto(proc, 1);
    }
}
