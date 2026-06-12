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
/* TU-private aggregate type defs (file-local) */
struct Pair
{
    s8 x;
    s8 y;
};
/* TU-private data externs bound at their JP addresses */
extern const struct Pair gMapanimEventcall_13[];
extern const struct Pair gMapanimEventcall_14[];
extern const struct Pair gMapanimEventcall_15[];

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

// clang-format on

//! FE8U = 0x08080BD8
void DemonKingSummonShake_Loop(struct MAEffectSummonProc * proc)
{
    int tmp = 8;

    if (proc->unk_29 == 0)
    {
        gBmSt.camera.x = proc->unk_2c;
        gBmSt.camera.y = proc->unk_2e;

        BG_SetPosition(BG_2, 8, 8);

        return;
    }

    if (proc->unk_36 > 0)
    {
        proc->unk_36--;
        return;
    }

    proc->unk_36 = proc->unk_34;

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_30 = gMapanimEventcall_13[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_13[proc->unk_38].y;

            break;

        case 1:
            proc->unk_30 = gMapanimEventcall_14[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_14[proc->unk_38].y;

            break;

        case 2:
            proc->unk_30 = gMapanimEventcall_15[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_15[proc->unk_38].y;

            break;

        default:
            proc->unk_30 = proc->unk_2a * gMapanimEventcall_14[proc->unk_38].x;
            proc->unk_32 = proc->unk_2a * gMapanimEventcall_14[proc->unk_38].y;

            break;
    }

    gBmSt.camera.x = proc->unk_2c + proc->unk_30;
    gBmSt.camera.y = proc->unk_2e + proc->unk_32;

    BG_SetPosition(BG_2, proc->unk_30 + 8, proc->unk_32 + 8);

    proc->unk_38++;

    if (proc->unk_38 >= tmp)
    {
        proc->unk_38 = 0;
    }

    return;
}
