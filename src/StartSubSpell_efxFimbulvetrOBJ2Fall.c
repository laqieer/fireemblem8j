#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFimbulvetrOBJ2Fall[];

// clang-format on

//! FE8U = 0x0805E53C
void StartSubSpell_efxFimbulvetrOBJ2Fall(struct Anim * anim, int unk)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    u8 array[8] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ2Fall, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 100;
    proc->unk29 = array[unk & 7];

    anim2 = AnimCreate(AnimScr_FimbulvetrOBJ2, 120);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);
    anim2->xPosition = 256;
    anim2->yPosition = 256;

    proc->unk32 = LCGRand_N(UINT16_MAX);
    proc->unk3A = LCGRand_N(UINT16_MAX);

    if (array[unk & 7] == 0)
    {
        proc->unk34 = (LCGRand_N(UINT16_MAX) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk34 = (LCGRand_N(UINT16_MAX) & 0x1FF) + 0xa00;
    }

    proc->unk3C = (LCGRand_N(UINT16_MAX - 240) & 0x3FF) - 0x100;
    proc->unk36 = LCGRand_N(UINT16_MAX - 240);
    proc->unk3E = LCGRand_N(UINT16_MAX - 240);

    if (array[unk & 7] == 0)
    {
        proc->unk38 = (LCGRand_N(UINT16_MAX - 240) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk38 = (LCGRand_N(UINT16_MAX - 240) & 0x1FF) + 0xa00;
    }

    proc->unk40 = (LCGRand_N(UINT16_MAX - 240) & 0x3FF) - 0x100;

    return;
}
