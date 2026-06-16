#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"

extern const u8 * CONST_DATA sUiFrameImageLookup[];
void UnpackUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sUiFrameImageLookup[gPlaySt.config.windowColor], dest);
}
