#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxCrimsonEyeOBJFinishPiece(struct Anim * anim, int terminator, u8 c, s8 flag);

//! FE8U = 0x0806A1EC
void efxCrimsonEyeOBJFinish_Loop(struct ProcEfxOBJ * proc)
{
    if (proc->timer < 44)
    {
        switch (proc->timer & 31)
        {
            case 0:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 0, 0);
                break;

            case 4:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 4, 1);
                break;

            case 8:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 1, 0);
                break;

            case 12:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 5, 1);
                break;

            case 16:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 2, 0);
                break;

            case 20:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 6, 1);
                break;

            case 24:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 3, 0);
                break;

            case 28:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 7, 1);
                break;

            case 2:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 8, 0);
                break;

            case 6:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 12, 1);
                break;

            case 10:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 9, 0);
                break;

            case 14:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 13, 1);
                break;

            case 18:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 10, 0);
                break;

            case 22:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 14, 1);
                break;

            case 26:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 11, 0);
                break;

            case 30:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 15, 1);
                break;

            case 1:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 16, 0);
                break;

            case 5:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 20, 1);
                break;

            case 9:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 17, 0);
                break;

            case 13:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 21, 1);
                break;

            case 17:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 18, 0);
                break;

            case 21:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 22, 1);
                break;

            case 25:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 19, 0);
                break;

            case 29:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 23, 1);
                break;

            case 3:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 24, 0);
                break;

            case 7:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 28, 1);
                break;

            case 11:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 25, 0);
                break;

            case 15:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 29, 1);
                break;

            case 19:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 26, 0);
                break;

            case 23:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 30, 1);
                break;

            case 27:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 27, 0);
                break;

            case 31:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 31, 1);
                break;
        }
    }

    proc->timer++;

    if (proc->timer == 48)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
