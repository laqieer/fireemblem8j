#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define SplineEvalCatmullRom impl_SplineEvalCatmullRom
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_800A34C.c"
#undef subroutine_arg0
#undef SplineEvalCatmullRom
#define SplineEvalCatmullRom ref_SplineEvalCatmullRom
#define subroutine_arg0 ref_subroutine_arg0
#define sub_800A194 refcallee_sub_800A194
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800A34C_ref.c"
#undef sub_800A194
#undef subroutine_arg0
#undef SplineEvalCatmullRom
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_800A34C");
    return 0;
}
