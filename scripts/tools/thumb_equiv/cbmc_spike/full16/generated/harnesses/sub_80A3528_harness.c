#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define sub_80A3528 impl_sub_80A3528
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A3528.c"
#undef subroutine_arg0
#undef sub_80A3528
#define sub_80A3528 ref_sub_80A3528
#define subroutine_arg0 ref_subroutine_arg0
#define BG_EnableSyncByMask refcallee_BG_EnableSyncByMask
#define BG_Fill refcallee_BG_Fill
#define PutDrawText refcallee_PutDrawText
#define PutNumber refcallee_PutNumber
#define PutNumber2Digit refcallee_PutNumber2Digit
#define PutSpecialChar refcallee_PutSpecialChar
#define ResetText refcallee_ResetText
#define SetTextFont refcallee_SetTextFont
#define SetTextFontGlyphs refcallee_SetTextFontGlyphs
#define sub_80A34F0 refcallee_sub_80A34F0
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A3528_ref.c"
#undef sub_80A34F0
#undef SetTextFontGlyphs
#undef SetTextFont
#undef ResetText
#undef PutSpecialChar
#undef PutNumber2Digit
#undef PutNumber
#undef PutDrawText
#undef BG_Fill
#undef BG_EnableSyncByMask
#undef subroutine_arg0
#undef sub_80A3528
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A3528");
    return 0;
}
