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

void efxDeadEvent_Loop_B(struct ProcEfxDead *proc)
{
    if (++proc->timer == 8) {
        NewEkrWindowAppear(1, 7);
        NewEkrNamewinAppear(1, 7, 0);
        Proc_Break(proc);
    }
}
