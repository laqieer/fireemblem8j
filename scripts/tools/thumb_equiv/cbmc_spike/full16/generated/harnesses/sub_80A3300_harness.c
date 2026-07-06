#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define sub_80A3300 impl_sub_80A3300
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A3300.c"
#undef subroutine_arg0
#undef sub_80A3300
#define sub_80A3300 ref_sub_80A3300
#define subroutine_arg0 ref_subroutine_arg0
#define PutSpriteExt refcallee_PutSpriteExt
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A3300_ref.c"
#undef PutSpriteExt
#undef subroutine_arg0
#undef sub_80A3300
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A3300");
    return 0;
}
