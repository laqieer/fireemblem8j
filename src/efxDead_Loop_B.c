#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/songs.h"




void efxDead_Loop_B(struct ProcEfxDead *proc)
{
    struct Anim *anim = proc->anim1;
    s16 time = ++proc->timer;

    if (time == 0x1E) {
        if (CheckEkrDragonDead(anim) == true)
            return;
        
        if (CheckEkrDragonSkipTransfer(proc->anim1) != false) {
            NewEfxDeadDragonAlpha(proc->anim1, proc->anim2);
            EfxPlaySE(SONG_D6, 0x100);
            M4aPlayWithPostionCtrl(SONG_D6, anim->xPosition, 1);
            proc->terminator = 0x64;
            return;
        }

        NewEfxDeadAlpha(proc->anim1, proc->anim2);
        EfxPlaySE(SONG_D6, 0x100);
        M4aPlayWithPostionCtrl(SONG_D6, anim->xPosition, 1);
        proc->terminator = 0x32;
        return;
    }

    if (time == proc->terminator) {
        gEkrHpBarCount--;
        gEkrDeadExist = 0;
        Proc_Break(proc);
    }
}
