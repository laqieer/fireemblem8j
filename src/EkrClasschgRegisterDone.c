#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

void EkrClasschgRegisterDone(struct ProcEkrClasschg * proc)
{
    proc->done = true;
}
