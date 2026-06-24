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

struct StaffReelEnt
{
    /* 00 */ void * img;
    /* 04 */ void * tsa;
};

struct CreditsEnt
{
    /* 00 */ const struct StaffReelEnt * entry;
    /* 04 */ const struct CreditsCG * cg[2];
    /* 0C */ int unk_0c; // delay before playing the CG
    /* 10 */ int unk_10; // delay before playing next staff credit roll
};

extern const struct CreditsEnt gEndingCredits_0[];
extern const u32 gEndingCredits_1[];

extern u16 gUnk_33[];

#define CREDITS_PARENT(proc) ((struct CreditsMainProc *)(proc->proc_parent))

// TODO: Implicit declaration
int CheckGameEndFlag(void);

//! FE8U = 0x080C4238
void EndingCredits_UpdateStaffReel(struct CreditsMainProc * proc)
{
    u32 something;
    s32 i;
    const struct CreditsEnt * ptr;

    proc->unk_35 = (proc->unk_30 >> 8) / 0x100;

    if (((proc->unk_30 >> 8) - ((proc->unk_30 >> 8) / 0x100) * 0x100 > 0xf) && (proc->unk_35 != proc->unk_34))
    {
        if (!proc->unk_29_2)
        {
            for (i = proc->unk_35 + 1; i < 22u; i++)
            {
                ptr = &gEndingCredits_0[i];

                if (ptr->cg[0] == NULL)
                {
                    continue;
                }

                proc->unk_48 = 0;

                if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA)
                {
                    proc->cg = ptr->cg[0];
                }
                else
                {
                    proc->cg = ptr->cg[1];
                }

                proc->unk_3c = ptr->unk_0c;
                proc->unk_40 = ptr->unk_10;

                proc->unk_29_2 = 1;
                proc->unk_29_1 = 1;
                break;
            }
        }

        ptr = &gEndingCredits_0[proc->unk_35 + 1];
        something = (proc->unk_35 + 1) & 1;
        if (ptr->entry != NULL)
        {
            Decompress(ptr->entry->img, (void *)(VRAM + gEndingCredits_1[something]));
            Decompress(ptr->entry->tsa, gGenericBuffer);
            CallARM_FillTileRect(
                gUnk_33, gGenericBuffer, (u16)((gEndingCredits_1[something] / CHR_SIZE) + 0x7000));
        }
        else
        {
            CpuFastFill(-1, (void *)(VRAM + gEndingCredits_1[something]), 0x20);
            for (i = 0; i < 0x400; i++)
            {
                gUnk_33[i] = (gEndingCredits_1[something] / CHR_SIZE) + 0x7000;
            }
        }

        proc->unk_34 = proc->unk_35;
    }

    return;
}
