#include "global.h"
#include "variables.h"
#include "functions.h"
#include "constants/video-global.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "bmlib.h"
#include "proc.h"
#include "event.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmio.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "mu.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "bmdifficulty.h"
#include "ctc.h"


#include "eventcall.h"
#include "bmudisp.h"

void RefreshEntityBmMaps(void);
void TornOutUnitSprite(struct Unit * unit, int timer);
void RefreshUnitSprites(void);

void UnitTornOut_Loop(struct ProcUnitTornOut * proc)
{
    struct Unit * unit = proc->unit;
    int timer = proc->timer;

    TornOutUnitSprite(unit, timer);

    if (proc->timer++ == 63)
    {
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
        Proc_Break(proc);
    }
}
