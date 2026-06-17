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




void DecideScriptA(void)
{
    int i = 0;

    if (UNIT_IS_GORGON_EGG(gActiveUnit))
        return;

    if (gAiState.flags & AI_FLAG_BERSERKED)
    {
        AiDoBerserkAction();
        return;
    }

    for (i = 0; i < 0x100; ++i)
    {
        if (AiTryExecScriptA() == TRUE)
            return;
    }

    AiExecFallbackScriptA();
}
