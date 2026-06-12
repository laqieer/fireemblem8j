extern int MapanimEventcall_SummonLoadFrameAndPal();
#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u8 gMapanimEventcall_12[];

struct MAEffectSummonProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ u8 unk_38;
    /* 3A */ STRUCT_PAD(0x3a, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 unk_4a;
    /* 4C */ STRUCT_PAD(0x4c, 0x50);
    /* 50 */ struct MAEffectSummonProc * unk_50;
};

//! FE8U = 0x08080B18
void DemonKingSummonAnim_PhaseOutro(struct MAEffectSummonProc * proc)
{
    if (proc->unk_42 == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_12[proc->unk_40], proc->unk_44);

        proc->unk_40++;
        proc->unk_42 = 5;

        if (proc->unk_40 > 3)
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;
            Proc_Break(proc);
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}
