#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"
/* TU-private data externs bound at their JP addresses */
extern const u16* sLegacyUiFramePaletteLookup[];

void UnpackLegacyUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_WINDOW_FRAME;

    ApplyPalette(sLegacyUiFramePaletteLookup[gPlaySt.config.windowColor], palId);
}
