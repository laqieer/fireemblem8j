#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



/* file-scope type definitions used by this run */


struct Proc085D84B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x08069AFC
void efxDarkGradoOBJ02piece_Loop(struct ProcEfxOBJ * proc)
{
    proc->unk48 += proc->unk44;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 - (proc->unk48 >> 8);
    }
    else
    {
        proc->anim2->xPosition = (proc->unk48 >> 8) + proc->unk32;
    }

    proc->anim2->yPosition = (proc->unk48 >> 8) + proc->unk3A;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
