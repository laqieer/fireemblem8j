#include "global.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiselecttarget.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmmind.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "trapfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bmusailment.h"
#include "constants/songs.h"

void SetClassToHatchingGorgonEgg(struct Unit* unit) {

    if (unit->pClassData->number != CLASS_GORGONEGG2) {
        unit->pClassData = GetClassData(CLASS_GORGONEGG2);

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        EndAllMus();
    }

    return;
}
