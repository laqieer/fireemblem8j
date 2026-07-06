#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define DecodeAndVerifyArenaRecord impl_DecodeAndVerifyArenaRecord
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A6F1C.c"
#undef subroutine_arg0
#undef DecodeAndVerifyArenaRecord
#define DecodeAndVerifyArenaRecord ref_DecodeAndVerifyArenaRecord
#define subroutine_arg0 ref_subroutine_arg0
#define sub_80A6AA8 refcallee_sub_80A6AA8
#define sub_80A6C20 refcallee_sub_80A6C20
#define sub_80A6D34 refcallee_sub_80A6D34
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A6F1C_ref.c"
#undef sub_80A6D34
#undef sub_80A6C20
#undef sub_80A6AA8
#undef subroutine_arg0
#undef DecodeAndVerifyArenaRecord
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A6F1C");
    return 0;
}
