

#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "face.h"

#include "functions.h"
#include "variables.h"
#include "bmlib.h"
#include "bg.h"
#include "scene.h"
#include "event.h"
#include "ekrbattle.h"


void ReputConvoBg_unused(int index)
{
    ResetDialogueScreen();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    Decompress(
        gConvoBackgroundData[index].gfx,
        (void*)(GetBackgroundTileDataOffset(3) + BG_VRAM));

    CallARM_FillTileRect(gBG3TilemapBuffer, gConvoBackgroundData[index].tsa, 0x8000);
    ApplyPalettes(gConvoBackgroundData[index].pal, 0x8, 0x8);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
}
