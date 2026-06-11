#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"

void LoadUiFrameGraphicsTo(unsigned vramOffset, int palId)
{
    UnpackUiFrameImage((void*)(VRAM + vramOffset));
    UnpackUiFramePalette(palId);
}
