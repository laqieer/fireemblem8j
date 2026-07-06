#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define SelectSummonPos impl_SelectSummonPos
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_807D3BC.c"
#undef subroutine_arg0
#undef SelectSummonPos
#define SelectSummonPos ref_SelectSummonPos
#define subroutine_arg0 ref_subroutine_arg0
#define AdvanceGetLCGRNValue refcallee_AdvanceGetLCGRNValue
#define CanUnitCrossTerrain refcallee_CanUnitCrossTerrain
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807D3BC_ref.c"
#undef CanUnitCrossTerrain
#undef AdvanceGetLCGRNValue
#undef subroutine_arg0
#undef SelectSummonPos
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_807D3BC");
    return 0;
}
