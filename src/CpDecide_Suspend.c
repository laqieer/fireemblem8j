#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "cp_utility.h"
#include "cp_script.h"
#include "bmsave.h"
#include "bmmind.h"
#include "constants/classes.h"
#include "cp_common.h"




void CpDecide_Suspend(ProcPtr proc)
{
    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        gActionData.suspendPointType = SUSPEND_POINT_BSKPHASE;
    else
        gActionData.suspendPointType = SUSPEND_POINT_CPPHASE;

    WriteSuspendSave(SAVE_ID_SUSPEND);
}
