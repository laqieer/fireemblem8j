#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"












 // maybe there is 0xC*sizeof(u16) free space





/* prototypes for same-file helpers called by this run */
struct Unit *GetUnitFromPrepList(int index);
int PrepGetUnitAmount();

void PrepAutoCapDeployUnits(struct ProcAtMenu* proc)
{
    int i;
    struct Unit *unit;

    proc->cur_counter = 0;
    proc->unit_count = 0;

    for (i = 0; i < PrepGetUnitAmount(); proc->unit_count++, i++) {
        unit = GetUnitFromPrepList(i);

        if (unit->state & 8)
            continue;

        if (unit->state & US_NOT_DEPLOYED)
            continue;
        {
            if (proc->cur_counter >= proc->max_counter)
                unit->state = 8;
            else
                proc->cur_counter++;
        }
    }

    if (proc->unit_count < proc->max_counter)
        proc->max_counter = proc->unit_count;
}
