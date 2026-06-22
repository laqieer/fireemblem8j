#include "global.h"
#include "anime.h"
#include "proc.h"
#include "efxbattle.h"
#include "ekrclasschg.h"

//! FE8U = 0x0807571C (JP)
void EfxClasschgCloneMain(struct ProcEfxBG * proc)
{
    struct Anim _anim;
    struct Anim * anim = proc->anim;

    _anim.xPosition = anim->xPosition;
    _anim.yPosition = anim->yPosition;
    _anim.pSpriteData = anim->pSpriteData;
    _anim.oamBase = anim->oamBase & ~0x0800;
    _anim.oam2Base = anim->oam2Base;

    _anim.oam2Base &= 0xF3FF;
    _anim.oam2Base |= 0x0800;

    AnimDisplay(&_anim);

    if (++proc->timer == proc->terminator)
        Proc_Break(proc);
}
