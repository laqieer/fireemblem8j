#include "global.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u16 Sprite_LinkArena_ChoiceBanner[];

// clang-format on

//! FE8U = 0x0804D834
void PutLinkArenaChoiceBannerSprite(int x, int y)
{
    PutSprite(1, x, y, Sprite_LinkArena_ChoiceBanner, OAM2_CHR(0x340) + OAM2_LAYER(1) + OAM2_PAL(2));
    return;
}
