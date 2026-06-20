#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "cg.h"
#include "ending_credits.h"

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

int CheckGameEndFlag(void);
void EndingCredits_UpdateStaffReel(struct CreditsMainProc *);
void EndingCredits_UpdateScroll(struct CreditsMainProc *);
void EndingCredits_LoadCG(struct CreditsMainProc *);

void EndingCredits_Loop_Main(struct CreditsMainProc * proc)
{
    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (CheckGameEndFlag() != 0))
    {
        Proc_Goto(proc, 0);
        return;
    }
    if (proc->unk_30 < 0x3800)
        proc->unk_30 += 0x780;
    if (!proc->unk_29_0)
        proc->unk_30 += 0x80;
    EndingCredits_UpdateStaffReel(proc);
    EndingCredits_UpdateScroll(proc);
    EndingCredits_LoadCG(proc);
    if ((u8)proc->unk_35 > 19)
    {
        proc->timer = 240;
        Proc_Break(proc);
    }
}
