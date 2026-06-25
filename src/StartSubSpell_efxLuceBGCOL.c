#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ekrdragon.h"

/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxLuceBGCOL[];
extern const u16 FrameConf_efxLuceBGCOL[];
extern const u16 Img_efxLuceBG[];
extern const u16 TsaLut_efxLuceBG[];
extern const u16 Map_efxLuceBG[];

void StartSubSpell_efxLuceBGCOL(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;
    struct Anim * other;
    void * sprite;
    int new_var;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLuceBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConf_efxLuceBGCOL;
    proc->pal = (void *)TsaLut_efxLuceBG;

    SpellFx_RegisterBgGfx(Img_efxLuceBG, 0x2000);
    SpellFx_RegisterBgPal(TsaLut_efxLuceBG - 0x10, 0x20);
    SpellFx_WriteBgMap(proc->anim, Map_efxLuceBG, Map_efxLuceBG);

    if (GetEkrDragonStatusType(gAnims[0]) == 0)
    {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
    else
    {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg3cnt.priority = 1;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
    }

    other = GetAnimAnotherSide(proc->anim);

    anim->oam2Base = (anim->oam2Base & 0xF3FF) | 0x400;
    other->oam2Base = (other->oam2Base & 0xF3FF) | 0x400;

    sprite = gEkrbattle_0[GetAnimPosition(other)];
    if (sprite != NULL)
    {
        new_var = (((struct Anim *)sprite)->oam2Base & 0xF3FF) | 0x400;
        ((struct Anim *)sprite)->oam2Base = new_var;
    }
}
