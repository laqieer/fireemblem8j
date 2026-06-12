#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gOpsubtitle_0[];

//! FE8U = 0x080C51C8
void OpSubtitle_SetupBackgrounds(void) {
    int bg;
    u16* bgConfig;

    memset(&gLCDControlBuffer.bg0cnt, 0, 2);
    memset(&gLCDControlBuffer.bg1cnt, 0, 2);
    memset(&gLCDControlBuffer.bg2cnt, 0, 2);
    memset(&gLCDControlBuffer.bg3cnt, 0, 2);

    bgConfig = gOpsubtitle_0;

    for (bg = 0; bg < 4; bg++) {
        SetBackgroundTileDataOffset(bg, *bgConfig++);
        SetBackgroundMapDataOffset(bg, *bgConfig++);
        SetBackgroundScreenSize(bg, *bgConfig++);

        BG_SetPosition(bg, 0, 0);
    }

    return;
}
