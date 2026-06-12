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

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxGorgonOBJTwisterPiece(struct Anim * anim, int flag, int c, int terminator);

//! FE8U = 0x0806BD94
void efxGorgonOBJTwister_Loop(struct ProcEfxOBJ * proc)
{
    switch (proc->timer & 0x1f)
    {
        case 0:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 0, 0, 12 - proc->timer);
            break;

        case 4:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 1, 5, 12 - proc->timer);
            break;

        case 8:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 0, 6, 12 - proc->timer);
            break;

        case 12:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 1, 4, 12 - proc->timer);
            break;

        case 16:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 0, 2, 12 - proc->timer);
            break;

        case 20:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 1, 1, 12 - proc->timer);
            break;

        case 24:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 0, 3, 12 - proc->timer);
            break;

        case 28:
            StartSubSpell_efxGorgonOBJTwisterPiece(proc->anim, 1, 7, 12 - proc->timer);
            break;
    }

    proc->timer++;

    if (proc->timer == 0xc)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
