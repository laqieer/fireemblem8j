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

//! FE8U = 0x0803F4EC
s8 AiDecideTalkBetweenChars(const void* input) {

    AiUpdateDecision(
        8,
        0,
        GetUnitFromCharId(((u8*)(input))[0])->index,
        GetUnitFromCharId(((u8*)(input))[1])->index,
        0xff
    );

    return 1;
}
