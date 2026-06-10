#include "global.h"
#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

extern int RefreshMinesOnBmMap();
extern int RefreshTorchlightsOnBmMap();
extern int RefreshUnitsOnBmMap();

void RefreshEntityBmMaps(void) {
    // 1. Clear unit & hidden maps

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapHidden, 0);

    // 2. Clear fog map, with 1 (visible) if no fog, with 0 (hidden) if yes fog

    BmMapFill(gBmMapFog, !gPlaySt.chapterVisionRange ? 1 : 0);

    // 3. Populate unit, fog & hidden maps

    RefreshTorchlightsOnBmMap();
    RefreshUnitsOnBmMap();
    RefreshMinesOnBmMap();
}
