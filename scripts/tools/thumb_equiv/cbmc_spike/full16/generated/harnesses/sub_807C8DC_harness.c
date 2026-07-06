#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define AdjustNewUnitPosition impl_AdjustNewUnitPosition
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_807C8DC.c"
#undef subroutine_arg0
#undef AdjustNewUnitPosition
#define AdjustNewUnitPosition ref_AdjustNewUnitPosition
#define subroutine_arg0 ref_subroutine_arg0
#define AiGetUnitClosestValidPosition refcallee_AiGetUnitClosestValidPosition
#define GenerateExtendedMovementMapOnRange refcallee_GenerateExtendedMovementMapOnRange
#define GetUnitMovementCost refcallee_GetUnitMovementCost
#define NextRN_N refcallee_NextRN_N
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807C8DC_ref.c"
#undef NextRN_N
#undef GetUnitMovementCost
#undef GenerateExtendedMovementMapOnRange
#undef AiGetUnitClosestValidPosition
#undef subroutine_arg0
#undef AdjustNewUnitPosition
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_807C8DC");
    return 0;
}
