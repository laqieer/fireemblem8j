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

//! FE8U = 0x0803F9A8
s8 AiFunc_MoveTowardsInputPosition(const void* input) {

    AiTryMoveTowards(((u8*)(input))[0], ((u8*)(input))[1], 0, 0xff, 1);

    return 1;
}
