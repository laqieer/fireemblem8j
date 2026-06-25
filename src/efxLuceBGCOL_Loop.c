#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ekrdragon.h"

extern u16 unk_efxLucePalBuf[];

void efxLuceBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    struct Anim * other;
    void * sprite;
    s16 ret;

    other = GetAnimAnotherSide(proc->anim);

    sprite = gEkrbattle_0[GetAnimPosition(other)];
    if (sprite != NULL)
        ((struct Anim *)sprite)->oam2Base = (((struct Anim *)sprite)->oam2Base & 0xF3FF) | 0x400;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
        EfxCyclePalette(proc->pal, unk_efxLucePalBuf, ret, 0xF, 0xF);

    proc->timer2++;

    if (proc->timer2 > proc->terminator)
    {
        gEfxBgSemaphore--;

        if (GetEkrDragonStatusType(gAnims[0]) == 0)
        {
            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg2cnt.priority = 2;
            gLCDControlBuffer.bg3cnt.priority = 3;
        }
        else
        {
            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg3cnt.priority = 2;
            gLCDControlBuffer.bg2cnt.priority = 3;
        }

        proc->anim->oam2Base = proc->anim->oam2Base & 0xF3FF;
        proc->anim->oam2Base = proc->anim->oam2Base | 0x800;
        other->oam2Base = (other->oam2Base & 0xF3FF) | 0x800;

        if (sprite != NULL)
            ((struct Anim *)sprite)->oam2Base = (((struct Anim *)sprite)->oam2Base & 0xF3FF) | 0x800;

        Proc_Break(proc);
    }
}
