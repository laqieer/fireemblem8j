#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

struct efxNaglfarObjScrs
{
    u32 * scr[12];
};

extern const struct efxNaglfarObjScrs AnimScr_efxNaglfarOBJ_Table;
extern const s16 gUnknown_080E3EF4[10];
extern const s16 gUnknown_080E3F08[10];

extern const struct ProcCmd ProcScr_efxNaglfarOBJ[];

void StartSubSpell_efxNaglfarOBJ(struct Anim * anim, int terminator, s16 x, s16 y, u8 pos, u8 index)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    struct efxNaglfarObjScrs scrs = AnimScr_efxNaglfarOBJ_Table;
    s16 gUnknown_080DEBF8[10];
    s16 gUnknown_080DEC0C[10];

    memcpy(gUnknown_080DEBF8, gUnknown_080E3EF4, sizeof(gUnknown_080DEBF8));
    memcpy(gUnknown_080DEC0C, gUnknown_080E3F08, sizeof(gUnknown_080DEC0C));

    GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarOBJ, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = scrs.scr[index * 2];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    switch (pos)
    {
        case 0:
            frontAnim->xPosition = x + gUnknown_080DEBF8[index * 2];
            frontAnim->yPosition = y + (gUnknown_080DEBF8 + 1)[index * 2];
            break;

        case 1:
            frontAnim->xPosition = x + gUnknown_080DEC0C[index * 2];
            frontAnim->yPosition = y + (gUnknown_080DEC0C + 1)[index * 2];
            break;
    }

    SpellFx_RegisterObjPal(Pal_NaglfarSprites_A, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_NaglfarSprites_A, 32 * 4 * CHR_SIZE);
}
