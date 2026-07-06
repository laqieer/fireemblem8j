#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define GmapScreen2_Loop impl_GmapScreen2_Loop
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80C05C8.c"
#undef subroutine_arg0
#undef GmapScreen2_Loop
#define GmapScreen2_Loop ref_GmapScreen2_Loop
#define subroutine_arg0 ref_subroutine_arg0
#define AP_Update refcallee_AP_Update
#define GmapScreen2_GetNodeScreenPos refcallee_GmapScreen2_GetNodeScreenPos
#define PutSpriteExt refcallee_PutSpriteExt
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80C05C8_ref.c"
#undef PutSpriteExt
#undef GmapScreen2_GetNodeScreenPos
#undef AP_Update
#undef subroutine_arg0
#undef GmapScreen2_Loop
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80C05C8");
    return 0;
}
