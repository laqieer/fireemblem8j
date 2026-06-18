#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "prepscreen.h"

void PutPrepChapterSprite_Skirmish(int xOam1, int yOam0, u16 oam2)
{
    PutSpriteExt(4, xOam1, yOam0, Sprite_PrepExMap, oam2);
}
