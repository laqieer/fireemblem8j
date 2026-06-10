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

bool EkrClasschgFinished(void)
{
    if (gpProcEkrClasschg->done == true)
        return true;

    return false;
}
