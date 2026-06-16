#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ctc.h"
#include "ekrclasschg.h"

extern struct ProcCmd ProcScr_efxLunaBG2[];

void StartSubSpell_efxLunaBG2(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_LunaBg2, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_LunaBg2, gEkrTsaBuffer);

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 32, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    SetWinEnable(0, 0, 0);

    return;
}
