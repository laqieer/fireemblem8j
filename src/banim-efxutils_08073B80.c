#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"

extern CONST_DATA short gEfxutils_0[0x140];

/* prototypes for same-file helpers called by this run */
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref);

void EfxChapterMapFadeOUT(int speed)
{
    UnpackChapterMapPalette();
    EfxPalBlackInOut(gPaletteBuffer, 6, 10, speed);
    EnablePaletteSync();
}
