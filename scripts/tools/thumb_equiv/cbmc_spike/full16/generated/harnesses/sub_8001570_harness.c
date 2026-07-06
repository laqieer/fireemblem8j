#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define AddAttr2dBitMap impl_AddAttr2dBitMap
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_8001570.c"
#undef subroutine_arg0
#undef AddAttr2dBitMap
#define AddAttr2dBitMap ref_AddAttr2dBitMap
#define subroutine_arg0 ref_subroutine_arg0

s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_8001570_ref.c"

#undef subroutine_arg0
#undef AddAttr2dBitMap
int main(void) {
    ASSERT(0, "UNKNOWN: complete observable model profile not yet generated for sub_8001570");
    return 0;
}
