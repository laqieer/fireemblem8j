#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/chapters.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

extern u16 EventScr_Ruin_83[];
extern u16 EventScr_Ruin_84[];
extern u16 EventScr_EirikaModeGameEnd[];
extern u16 EventScr_EphraimModeGameEnd[];

extern struct ProcCmd CONST_DATA ProcScr_GameEarlyStartUI[]; // pre-intro cutscene
extern struct ProcCmd CONST_DATA ProcScr_OpAnim[]; // intro cutscene
extern struct ProcCmd CONST_DATA ProcScr_WorldMapWrapper[];





void Nop_Gamecontrol_0()
{
    return;
}

void GameControl_EnableSoundEffects(ProcPtr proc)
{
    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 0;
}

void GameControl_ResetPlayConfig(ProcPtr proc)
{

    gPlaySt.config.animationType = 0;
    gPlaySt.config.textSpeed = 1;
    gPlaySt.config.gameSpeed = 0;
    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 1;
    gPlaySt.config.windowColor = 0;
    gPlaySt.config.unitColor = 0;
}
