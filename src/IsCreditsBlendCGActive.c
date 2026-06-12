#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"
#include "ending_credits.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EndingCredits_BlendCGMaybe[];

//! FE8U = 0x080C4210
bool IsCreditsBlendCGActive(void)
{
    return Proc_Find(ProcScr_EndingCredits_BlendCGMaybe) ? true : false;
}
