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
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);

struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned pal)
{
    struct MuProc * proc;
    
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, pal);
    proc->unit = unit;
    proc->cam_b = true;
    return proc;
}
