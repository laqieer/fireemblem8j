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




void DecideSpecialItems(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    AiTryDoSpecialItems();
}
