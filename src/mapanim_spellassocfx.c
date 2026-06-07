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

static struct MapAnimStarfxConf gMapAnimStarfxConfs[0x10];
static u16 sSpellAssocPalBackup[0xA0];

CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[] = {
    PROC_CALL(SpellAssocFadeMain),
    PROC_SLEEP(0xF),
    PROC_END
};

void MapAnimStartSpellAssocFadeExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapAnimStartSpellAssocFade, proc);
    else
        Proc_Start(ProcScr_MapAnimStartSpellAssocFade, PROC_TREE_3);
}

void SpellAssocFadeMain(ProcPtr proc)
{
    int i;

    CpuFastCopy(PAL_BG(0x6), sSpellAssocPalBackup, 0x140);

    for (i = 0; i < 10; i++)
        SetPalFadeStop(StartPalFade(Pal_AllBlack, i + 6, 0x3C, proc), 15);
}

void MapAnimSpellAssocResetPalExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapAnimSpellAssocResetPal, proc);
    else
        Proc_Start(ProcScr_MapAnimSpellAssocResetPal, PROC_TREE_3);
}

void SpellAssocResetPalMain(ProcPtr proc)
{
    int i;
    for (i = 0; i < 10; i++)
        StartPalFade(sSpellAssocPalBackup + 0x10 * i, i + 6, 15, proc);
}

void NewBG0Shaker(void)
{
    Proc_Start(ProcScr_MapAnimBgShaker, PROC_TREE_3);
}

void BG0Shaker_Init(struct MAFrameShakeProc * proc)
{
    proc->timer = 0;
}
