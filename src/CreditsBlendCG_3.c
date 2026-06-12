#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"
#include "ending_credits.h"

struct CreditsSubProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct CreditsCG * cg;
    /* 30 */ s16 unk_30;
    /* 32 */ STRUCT_PAD(0x32, 0x34);
    /* 34 */ s16 unk_34;
};

//! FE8U = 0x080C4184
void CreditsBlendCG_3(struct CreditsSubProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30 < 120)
    {
        int tmp = _DivArm2(119 - proc->unk_30, 120, 1);
        int bldAmt = DivArm(0x1000, (0x1000 - tmp) * 16);
        SetBlendAlpha(bldAmt, 16 - bldAmt);
    }
    else
    {
        SetBlendAlpha(16, 0);
        Proc_Break(proc);
    }

    return;
}
