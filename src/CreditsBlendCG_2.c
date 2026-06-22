#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"

#include "ending_credits.h"

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

struct CreditsMainProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 29 */ u8 unk_29_2 : 1;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ s8 unk_34;
    /* 35 */ s8 unk_35;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ const struct CreditsCG * cg;
    /* 48 */ s8 unk_48;
    /* 4A */ s16 timer;
};

#define CREDITS_PARENT(proc) ((struct CreditsMainProc *)(proc->proc_parent))

//! FE8U = 0x080C8F10
void CreditsBlendCG_2(struct CreditsSubProc * proc)
{
    proc->unk_34--;

    if (proc->unk_34 < 1)
    {
        proc->unk_30 = 0;
        CREDITS_PARENT(proc)->unk_29_0 = 0;
        Proc_Break(proc);
    }

    return;
}
