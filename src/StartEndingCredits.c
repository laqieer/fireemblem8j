#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"
#include "ending_credits.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EndingCredits[];

// clang-format on

//! FE8U = 0x080C4878
void StartEndingCredits(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_EndingCredits, parent);
    return;
}
