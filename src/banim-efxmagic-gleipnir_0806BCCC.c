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
void NewEfxDarkGradoOBJ01piece(struct Anim * anim, s16 b, s16 c, s16 d, u16 e);

//! FE8U = 0x080699A8
void efxDarkGradoOBJ01_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (DivRem(proc->timer, 12) == 0)
    {
        if ((proc->terminator & 1) == 0)
        {
            NewEfxDarkGradoOBJ01piece(proc->anim, (proc->terminator >> 1) & 3, 0, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 2) & 3, 1, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 1) & 3, 2, 0x100, 98 - proc->timer);
        }
        else
        {
            NewEfxDarkGradoOBJ01piece(proc->anim, (proc->terminator >> 1) & 3, 3, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 2) & 3, 4, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 1) & 3, 5, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 3) & 3, 6, 0x100, 98 - proc->timer);
        }

        proc->terminator++;
    }

    if (proc->timer == 97)
    {
        Proc_Break(proc);
    }

    return;
}
