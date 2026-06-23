#include "global.h"
#include "bm.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "chapterdata.h"
#include "event.h"

void EventSetFogVisionExt(s16 visionRange, s8 flag, ProcPtr parent)
{
    if (visionRange < 0)
        visionRange = GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;

    if (flag == 1)
        RenderBmMapOnBg2();

    gPlaySt.chapterVisionRange = visionRange;

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    if (flag == 1)
        MakeNew6CBMXFADE2(1, parent);
}
