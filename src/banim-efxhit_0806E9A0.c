#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */

extern CONST_DATA struct ProcCmd ProcScr_efxDamageMojiEffect[];

void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted)
{
    u16 val1;
    u32 * anim_scr;
    struct ProcEfxDamageMojiEffectOBJ * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffectOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (hitted == 0) {
        proc->terminator = 0x32;
        anim_scr = AnimScr_NoDamage;
    } else {
        proc->terminator = 0x32;
        anim_scr = AnimScr_Miss;
    }

    val1 = GetAnimPosition(anim) == EKR_POS_L ? 0x6100 : 0x5100;
    proc->sub_proc = NewEkrsubAnimeEmulator(
        anim->xPosition,
        anim->yPosition - 0x28,
        anim_scr,
        2, val1, 0, PROC_TREE_3
    );
}
