#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

void GMapScreen_OnWorldmapEventUpdate(void)
{
    Sound_StopBgmImmediate();
    MapRoute_0(GM_SCREEN->gmroute);
    GM_SCREEN->gmroute->flags |= 3;
    EndWMFaceCtrl();
}
