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
int PrepGetLatestCharId();

int PrepGetLatestUnitIndex()
{
    int i;
    for (i = 0; i < PrepGetUnitAmount(); i++) {
        if (UNIT_CHAR_ID(GetUnitFromPrepList(i)) == PrepGetLatestCharId())
            return i;
    }
    return 0;
}
