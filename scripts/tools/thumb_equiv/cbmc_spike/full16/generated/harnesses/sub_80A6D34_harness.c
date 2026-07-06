#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define sub_80A6D34 impl_sub_80A6D34
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A6D34.c"
#undef subroutine_arg0
#undef sub_80A6D34
#define sub_80A6D34 ref_sub_80A6D34
#define subroutine_arg0 ref_subroutine_arg0
#define sub_80A6AC0 refcallee_sub_80A6AC0
#define sub_80A6C20 refcallee_sub_80A6C20
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6D34_ref.c"
#undef sub_80A6C20
#undef sub_80A6AC0
#undef subroutine_arg0
#undef sub_80A6D34
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A6D34");
    return 0;
}
