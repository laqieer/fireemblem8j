#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"
/* TU-private data externs bound at their JP addresses */
extern const u16* sStatBarPaletteLookup[];

void UnpackUiBarPalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_STATBAR;

    ApplyPalette(sStatBarPaletteLookup[gPlaySt.config.windowColor], palId);
}
