#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFenrirOBJ2Chiri[];
extern int gFenrirSpriteAngles[];

// clang-format on

//! FE8U = 0x08060F24
void StartSubSpell_efxFenrirOBJ2Chiri(struct Anim * anim, int idx)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2Chiri, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 30;

    proc->unk44 = gFenrirSpriteAngles[idx & 7];

    otherAnim = NULL;

    switch (idx & 1)
    {
        case 0:
            otherAnim = AnimCreate(AnimScr_EfxFenrir1, 120);
            proc->anim2 = otherAnim;

            break;

        case 1:
            otherAnim = AnimCreate(AnimScr_EfxFenrir2, 120);
            proc->anim2 = otherAnim;

            break;
    }

    otherAnim->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);

    otherAnim->xPosition = anim->xPosition;
    proc->unk32 = anim->xPosition;

    otherAnim->yPosition = anim->yPosition;
    proc->unk3A = anim->yPosition;

    return;
}
