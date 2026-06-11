#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxLiveBGCOL[];
extern const u16 gEfxmagicHealstaves_5[];
extern const u16 gEfxmagicHealstaves_6[];
extern const u16 gEfxmagicHealstaves_7[];

//! FE8U = 0x080617E4
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gEfxmagicHealstaves_5;
    }
    else if (kind == 1)
    {
        proc->frame_config = gEfxmagicHealstaves_6;
    }
    else
    {
        proc->frame_config = gEfxmagicHealstaves_7;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = Pal_efxLiveBGCOL;
    }
    else
    {
        proc->pal = Pal_Banim_4;
    }

    return;
}
