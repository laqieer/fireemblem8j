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

void EfxClasschgFinMain(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;
    gLCDControlBuffer.bgoffset[1].y--;
    
    if (++proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        anim->oamBase  &= ~0x800;
        anim->oam2Base &= 0xF3FF;
        anim->oam2Base |= 0x0800;
        Proc_Break(proc);
    }
}
