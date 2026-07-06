#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define GetUnitDefinitionFormEventScr impl_GetUnitDefinitionFormEventScr
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_800FAD0.c"
#undef subroutine_arg0
#undef GetUnitDefinitionFormEventScr
#define GetUnitDefinitionFormEventScr ref_GetUnitDefinitionFormEventScr
#define subroutine_arg0 ref_subroutine_arg0
#define NextRN_N refcallee_NextRN_N
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800FAD0_ref.c"
#undef NextRN_N
#undef subroutine_arg0
#undef GetUnitDefinitionFormEventScr
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_800FAD0");
    return 0;
}
