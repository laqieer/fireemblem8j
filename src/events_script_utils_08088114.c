#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "chapterdata.h"
#include "playerphase.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "gba_sprites.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/video-global.h"
#include "constants/songs.h"





















































































extern CONST_DATA u16 Obj_EventsScriptUtils_0[];

extern CONST_DATA u16 * ImgLut_EventMapAnimMaskfx[];

extern u16 CONST_DATA * TsaLut_EventMapAnimMaskfx[];

void EventMapAnim_Init(struct ProcEventMapAnim * proc)
{
    if (0 == proc->mode)
        StartBgm(SONG_VICTORY_SONG_B, 0);
    else
        StartBgm(SONG_VICTORY_SONG_A, 0);

    SetDispEnable(1, 1, 1, 1, 1);
    proc->timer = 0;
}
