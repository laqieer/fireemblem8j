#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiCursorHand[];

//! FE8U = 0x080ACB00
void EndUiCursorHand(void)
{
    Proc_End(Proc_Find(gProcScr_UiCursorHand));
    return;
}
