#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define SplineSampleAtTime impl_SplineSampleAtTime
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_800A594.c"
#undef subroutine_arg0
#undef SplineSampleAtTime
#define SplineSampleAtTime ref_SplineSampleAtTime
#define subroutine_arg0 ref_subroutine_arg0
#define SplineEvalCatmullRom refcallee_SplineEvalCatmullRom
#define sub_80D6384 refcallee_sub_80D6384
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800A594_ref.c"
#undef sub_80D6384
#undef SplineEvalCatmullRom
#undef subroutine_arg0
#undef SplineSampleAtTime
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_800A594");
    return 0;
}
