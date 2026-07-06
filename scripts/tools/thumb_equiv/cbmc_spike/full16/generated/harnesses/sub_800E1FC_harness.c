#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define Event18_ColorFade impl_Event18_ColorFade
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_800E1FC.c"
#undef subroutine_arg0
#undef Event18_ColorFade
#define Event18_ColorFade ref_Event18_ColorFade
#define subroutine_arg0 ref_subroutine_arg0
#define EventEndFade refcallee_EventEndFade
#define EventStartFade refcallee_EventStartFade
#define NewEventFadefx refcallee_NewEventFadefx
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_800E1FC_ref.c"
#undef NewEventFadefx
#undef EventStartFade
#undef EventEndFade
#undef subroutine_arg0
#undef Event18_ColorFade
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_800E1FC");
    return 0;
}
