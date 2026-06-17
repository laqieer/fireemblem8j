#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"




void efxFimbulvetrOBJ2Fall_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
    }
    else
    {
        if (!(proc->timer & 1))
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk32 += proc->unk34;
            proc->unk3A += proc->unk3C;
            anim->xPosition = proc->unk32 >> 8;
            anim->yPosition = proc->unk3A >> 8;
        }
        else
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk3E += proc->unk38;
            proc->unk3E += proc->unk40;
            anim->xPosition = proc->unk36 >> 8;
            anim->yPosition = proc->unk3E >> 8;
        }
    }

    return;
}
