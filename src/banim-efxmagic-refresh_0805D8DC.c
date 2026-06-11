#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxSongOBJ[];

// clang-format on

//! FE8U = 0x0805CB40
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 56;
    scr = AnimScr_EfxSong;
    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SongSprites, 32 * 4 * CHR_SIZE);

    return;
}
