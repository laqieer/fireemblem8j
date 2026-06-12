#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

extern EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg;

void NewEfxClasschgFIN(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgFIN, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    SpellFx_RegisterBgPal(Pal_Ekrdragonfx_0, 0x20);
    SpellFx_RegisterBgGfx(Img_Banim_12, 0x2000);

    EfxTmCpyBG(Tsa_Banim_16, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetBlendConfig(0x1, 0xE, 0x8, 0x0);

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    gLCDControlBuffer.bldcnt.target2_bd_on = true;

    anim->oamBase  |= 0x0800;
    anim->oam2Base &= 0xF3FF;
    anim->oam2Base |= 0x0400;
}
