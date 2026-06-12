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

void efxDeadEvent_Loop_E(struct ProcEfxDead *proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        gEkrDeadEventExist = false;
        Proc_Break(proc);
    }
}
