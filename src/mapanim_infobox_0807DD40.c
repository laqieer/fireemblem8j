#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void UncompMapBattleBoxNumGfx(int tileNum)
{
    Decompress(
        Img_MapBattleInfoNum,
        (u8*)(VRAM) + GetBackgroundTileDataOffset(0) + 0x20*(tileNum & 0x3FF));
}
