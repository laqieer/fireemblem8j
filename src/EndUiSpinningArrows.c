#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiSpinningArrows[];

//! FE8U = 0x080ACDDC
void EndUiSpinningArrows(void)
{
    Proc_End(Proc_Find(gProcScr_UiSpinningArrows));
    return;
}
