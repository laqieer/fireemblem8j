#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define DivinationRankSpriteUpdate impl_DivinationRankSpriteUpdate
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A2E64.c"
#undef subroutine_arg0
#undef DivinationRankSpriteUpdate
#define DivinationRankSpriteUpdate ref_DivinationRankSpriteUpdate
#define subroutine_arg0 ref_subroutine_arg0
#define PutSpriteExt refcallee_PutSpriteExt
#define SetObjAffine refcallee_SetObjAffine
#define sub_80A2E4C refcallee_sub_80A2E4C
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A2E64_ref.c"
#undef sub_80A2E4C
#undef SetObjAffine
#undef PutSpriteExt
#undef subroutine_arg0
#undef DivinationRankSpriteUpdate
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A2E64");
    return 0;
}
