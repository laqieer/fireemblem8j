#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"
/* TU-private data externs bound at their JP addresses */
extern const void* sUiFrameImageLookup[];

void UnpackUiFrameBuffered(int id)
{
    int bufSize;
    s8* bufAddr;

    if (id < 0)
        id = gPlaySt.config.windowColor;

    bufSize = GetDataSize(sUiFrameImageLookup[id]);
    bufAddr = gFadeComponentStep - bufSize;

    Decompress(sUiFrameImageLookup[id], bufAddr);
    RegisterDataMove(bufAddr, BG_CHAR_ADDR(0), bufSize);

    UnpackUiFramePalette(-1);
}
