#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define Augury_InitResultScreen impl_Augury_InitResultScreen
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_80A390C.c"
#undef subroutine_arg0
#undef Augury_InitResultScreen
#define Augury_InitResultScreen ref_Augury_InitResultScreen
#define subroutine_arg0 ref_subroutine_arg0
#define BG_EnableSyncByMask refcallee_BG_EnableSyncByMask
#define Decompress refcallee_Decompress
#define EndCgText refcallee_EndCgText
#define EndFaceById refcallee_EndFaceById
#define GetSavedRankData refcallee_GetSavedRankData
#define InitTalk refcallee_InitTalk
#define SetCgTextFlags refcallee_SetCgTextFlags
#define StartCgText refcallee_StartCgText
#define StartFace2 refcallee_StartFace2
#define j_TmApplyTsa refcallee_j_TmApplyTsa
#define strcpy refcallee_strcpy
#define sub_80A33E0 refcallee_sub_80A33E0
#define sub_80A3528 refcallee_sub_80A3528
#define sub_80A40A0 refcallee_sub_80A40A0
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_80A390C_ref.c"
#undef sub_80A40A0
#undef sub_80A3528
#undef sub_80A33E0
#undef strcpy
#undef j_TmApplyTsa
#undef StartFace2
#undef StartCgText
#undef SetCgTextFlags
#undef InitTalk
#undef GetSavedRankData
#undef EndFaceById
#undef EndCgText
#undef Decompress
#undef BG_EnableSyncByMask
#undef subroutine_arg0
#undef Augury_InitResultScreen
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_80A390C");
    return 0;
}
