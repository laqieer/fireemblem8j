#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"

extern const u16 Sprite_LinkArenaBButton[];

void PutLinkArenaButtonSpriteAt(int x, int y)
{
    PutSprite(4, x, y, Sprite_LinkArenaBButton, 0);
    return;
}
