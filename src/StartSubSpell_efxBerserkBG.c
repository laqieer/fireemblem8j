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
#include "ekrdragon.h"

extern struct ProcCmd ProcScr_efxBerserkBG[];

void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(Pal_BerserkBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_Banim_12, 32 * 8 * CHR_SIZE);

    EfxTmCpyBG(Tsa_Banim_16, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    SpellFx_SetSomeColorEffect();
    SetBlendAlpha(14, 8);

    NewEkrDragonPalFade();

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    anim->oamBase |= OAM0_WINDOW;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    return;
}
