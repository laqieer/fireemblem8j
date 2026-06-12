#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"
/* TU-private data externs bound at their JP addresses */
extern const void* sLegacyUiFrameImageLookup[];

void UnpackLegacyUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sLegacyUiFrameImageLookup[gPlaySt.config.windowColor], dest);
}
