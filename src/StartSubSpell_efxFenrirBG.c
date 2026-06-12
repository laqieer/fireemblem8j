#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFenrirBG[];

// clang-format on

//! FE8U = 0x08060A9C
void StartSubSpell_efxFenrirBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_FenrirBg_Sigils, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_FenrirBg_Sigils, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(2);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}
