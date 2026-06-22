#include "global.h"
#include "bmlib.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmbattle.h"
#include "bksel.h"

#include "constants/songs.h"

void LABattleMap_ForecastConfirm_Loop(ProcPtr proc)
{
    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        CloseBattleForecast();

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        CloseBattleForecast();

        Proc_Goto(proc, 0);
    }

    return;
}
