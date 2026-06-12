#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"
#include "ending_credits.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EndingCredits_BlendCGMaybe[];

struct CreditsCG
{
    /* 00 */ u8 * img[10];
    /* 28 */ u8 * tsa;
    /* 2C */ u16 * pal;
    /* 30 */ u16 unk_30;
    STRUCT_PAD(0x32, 0x34);
};
struct CreditsSubProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct CreditsCG * cg;
    /* 30 */ s16 unk_30;
    /* 32 */ STRUCT_PAD(0x32, 0x34);
    /* 34 */ s16 unk_34;
};

// clang-format on

//! FE8U = 0x080C41F4
void StartBlendCreditsCGMaybe(ProcPtr parent, const struct CreditsCG * cg)
{
    struct CreditsSubProc * proc = Proc_Start(ProcScr_EndingCredits_BlendCGMaybe, parent);
    proc->cg = cg;
    return;
}
