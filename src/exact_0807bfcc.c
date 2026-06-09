#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"




































































/* prototypes for same-file helpers called by this run */
struct MuProc * GetMu(int slot);

struct MuProc * GetUnitMu(struct Unit * unit)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);

        if (proc->unit == unit)
            return proc;
    }
    return NULL;
}
