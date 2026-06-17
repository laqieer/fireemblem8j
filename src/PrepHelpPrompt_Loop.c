#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "ap.h"
#include "proc.h"
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "helpbox.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bmsave.h"
#include "bmlib.h"
#include "eventcall.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/terrains.h"
#include "constants/songs.h"




void PrepHelpPrompt_Loop(void)
{
    PutSprite(4, 64, 140, gObject_32x16, OAM2_CHR(0x38B) + OAM2_PAL(2));
    PutSprite(4, 96, 140, gObject_32x16, OAM2_CHR(0x38F) + OAM2_PAL(2));
    PutSprite(4, 128, 140, gObject_16x16, OAM2_CHR(0x393) + OAM2_PAL(2));
    PutSprite(4, 160, 140, gObject_32x16, OAM2_CHR(0x395) + OAM2_PAL(2));
    PutSprite(4, 192, 140, gObject_32x16, OAM2_CHR(0x399) + OAM2_PAL(2));
    PutSprite(4, 224, 140, gObject_8x16, OAM2_CHR(0x39D) + OAM2_PAL(2));
}
