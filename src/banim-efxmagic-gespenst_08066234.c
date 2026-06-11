#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxGespenstBG4[];

// clang-format on

//! FE8U = 0x08064D00
void StartSubSpell_efxGespenstBG4(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_GespenstBg4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_GespenstBg4, PLTT_SIZE_4BPP);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_GespenstBg4, gEkrTsaBuffer);
    EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}
