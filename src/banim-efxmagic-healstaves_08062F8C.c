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
extern struct ProcCmd ProcScr_efxReserveBG2[];
extern u16 * TsaArray_FortifyBg2[];

// clang-format on

//! FE8U = 0x08061E8C
void StartSubSpell_efxReserveBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 220,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_FortifyBg2;
    proc->tsar = TsaArray_FortifyBg2;

    SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetEkrMiniAnimLayerFlag();

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    otherAnim = gEkrbattle_0[GetAnimPosition(anim)];
    if (otherAnim != NULL)
    {
        otherAnim->oam2Base &= ~OAM2_LAYER(3);
        otherAnim->oam2Base |= OAM2_LAYER(1);
    }

    SpellFx_SetSomeColorEffect();
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}
