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

struct MuProc * StartMu(struct Unit * unit)
{
    struct MuProc * proc;

    unsigned jid = UNIT_CLASS_ID(unit);

    if (unit->state & US_IN_BALLISTA)
    {
        switch (GetTrap(unit->ballistaIndex)->extra) {
        case ITEM_BALLISTA_REGULAR:
            jid = CLASS_BLST_REGULAR_USED;
            break;

        case ITEM_BALLISTA_LONG:
            jid = CLASS_BLST_LONG_USED;
            break;

        case ITEM_BALLISTA_KILLER:
            jid = CLASS_BLST_KILLER_USED;
            break;

        } // switch (blst->extra)
    }

    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, GetUnitSpritePalette(unit));
    proc->unit = unit;
    proc->cam_b = true;
    return proc;
}
