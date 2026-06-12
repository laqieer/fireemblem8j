#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiSpinningArrows[];

// clang-format on

//! FE8U = 0x080ACCE0
ProcPtr StartUiSpinningArrows(ProcPtr parent)
{
    return Proc_Start(gProcScr_UiSpinningArrows, parent);
}
