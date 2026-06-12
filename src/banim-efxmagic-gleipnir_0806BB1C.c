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

/* prototypes for same-file helpers called by this run */
int efxDarkGradoGetPieceX(int a, int b, int c);
int efxDarkGradoGetPieceY(int a, int b, int c);

//! FE8U = 0x080697F4
void efxDarkGradoOBJ01piece_Loop(struct ProcEfxOBJ * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 + efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        proc->anim2->xPosition = proc->unk32 - efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }

    proc->anim2->yPosition = proc->unk3A + efxDarkGradoGetPieceY(proc->timer, proc->unk44, proc->unk48);

    proc->timer++;

    if ((proc->timer == proc->terminator) || (proc->timer == proc->unk4C))
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
