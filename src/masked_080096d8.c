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





int GetRealChaperIndex(int chapterId)
{

    switch (chapterId) {
    case CHAPTER_L_2:
        return 1;

    case CHAPTER_L_3:
        return 2;

    case CHAPTER_L_4:
        return 3;

    case CHAPTER_L_5X:
    case CHAPTER_L_5:
        return 4;

    case CHAPTER_L_6:
        return 5;

    case CHAPTER_L_7:
        return 6;

    case CHAPTER_L_8:
    case CHAPTER_CASTLE_FRELIA:
        return 7;

    case CHAPTER_E_9:
    case CHAPTER_I_9:
        return 8;

    case CHAPTER_E_10:
    case CHAPTER_I_10:
        return 9;

    case CHAPTER_E_12:
    case CHAPTER_I_12:
    case CHAPTER_E_11:
    case CHAPTER_I_11:
        return 10;

    case CHAPTER_E_13:
    case CHAPTER_I_13:
        return 11;

    case CHAPTER_E_14:
    case CHAPTER_I_14:
        return 12;

    case CHAPTER_E_15:
    case CHAPTER_I_15:
        return 13;

    case CHAPTER_E_16:
    case CHAPTER_I_16:
        return 14;

    case CHAPTER_E_17:
    case CHAPTER_I_17:
        return 15;

    case CHAPTER_E_18:
    case CHAPTER_I_18:
        return 16;

    case CHAPTER_E_19:
    case CHAPTER_I_19:
        return 17;

    case CHAPTER_E_20:
    case CHAPTER_I_20:
        return 18;

    case CHAPTER_E_21:
    case CHAPTER_E_21X:
    case CHAPTER_I_21:
    case CHAPTER_I_21X:
        return 19;

    case CHAPTER_L_PROLOGUE:
    case CHAPTER_L_1:
    default:
        return 0;
    }
}
