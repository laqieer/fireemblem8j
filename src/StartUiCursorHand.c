#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiCursorHand[];

// clang-format on

//! FE8U = 0x080AC9C0
ProcPtr StartUiCursorHand(ProcPtr parent)
{
    return Proc_Start(gProcScr_UiCursorHand, parent);
}
