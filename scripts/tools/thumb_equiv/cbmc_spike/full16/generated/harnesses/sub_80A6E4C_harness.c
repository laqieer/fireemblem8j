#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define sub_80A6E4C impl_sub_80A6E4C
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A6E4C.c"
#undef subroutine_arg0
#undef sub_80A6E4C
#define sub_80A6E4C ref_sub_80A6E4C
#define subroutine_arg0 ref_subroutine_arg0
#define sub_80A6A7C refcallee_sub_80A6A7C
#define sub_80A6AA8 refcallee_sub_80A6AA8
#define sub_80A6C20 refcallee_sub_80A6C20
#define sub_80A6C60 refcallee_sub_80A6C60
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6E4C_ref.c"
#undef sub_80A6C60
#undef sub_80A6C20
#undef sub_80A6AA8
#undef sub_80A6A7C
#undef subroutine_arg0
#undef sub_80A6E4C
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A6E4C");
    return 0;
}
