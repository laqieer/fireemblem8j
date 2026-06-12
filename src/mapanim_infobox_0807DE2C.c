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

/* prototypes for same-file helpers called by this run */
void UncompMapBattleBoxNumGfx(int tileNum);

void PrepareMapBattleBoxNumGfx(const u8* src)
{
    UncompMapBattleBoxNumGfx(0x20);
    Decompress(src, (u8*)(VRAM + 0x20 * 43)); // TODO: named constants
    ApplyPalette(Pal_MapBattleInfoNum, 5);
}
