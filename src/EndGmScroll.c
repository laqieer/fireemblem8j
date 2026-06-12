#include "global.h"
#include "spline.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmScrollManage[];

void EndGmScroll(void)
{
    struct WorldMapMainProc * worldMapProc = Proc_Find(ProcScr_WorldMapMain);
    Proc_EndEach(ProcScr_GmScrollManage);

    worldMapProc->scrolling |= 1;
}
