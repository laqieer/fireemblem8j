#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"

//! FE8U = 0x0803F37C
s8 AiFunc_RestartDecisionStateDuplicate(const void* input) {

    int i;
    int faction = GetCurrentPhase();

    for (i = faction + 1; i < faction + 0x80; i++) {
        GetUnit(i);
    }

    gAiState.decideState = 0;

    return 0;
}
