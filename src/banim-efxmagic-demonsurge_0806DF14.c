#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

// clang-format off



/* file-scope type definitions used by this run */


struct Proc085D8C24
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

struct Proc085D8CE4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

struct Proc085D8D14
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x0806BBF0
void efxGorgonOBJTwisterPiece_Loop(struct ProcEfxOBJ * proc)
{
    switch (proc->unk44)
    {
        case 0:
            proc->anim2->xPosition -= 2;
            break;

        case 1:
            proc->anim2->xPosition -= 3;
            break;

        case 2:
            proc->anim2->xPosition -= 4;
            break;

        case 3:
            proc->anim2->xPosition += 2;
            break;

        case 4:
            proc->anim2->xPosition += 3;
            break;

        case 5:
            proc->anim2->xPosition += 4;
            break;
    }

    proc->anim2->yPosition -= 6;

    proc->timer++;

    if ((proc->timer == proc->terminator) || (proc->anim2->xPosition < -16))
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
