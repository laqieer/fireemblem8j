#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmsave.h"
#include "chapterdata.h"
#include "bm.h"
#include "rng.h"
#include "scene.h"
#include "gamecontrol.h"
#include "bmdebug.h"
#include "soundroom.h"
#include "menu_def.h"
#include "worldmap.h"

void sub_801BA6C(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc);

//! FE8U = 0x0801BAEC
u8 DebugMenu_WeatherIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    struct DebugPrintProc* debugPrintProc;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_LEFT | DPAD_RIGHT)) {
        debugPrintProc = Proc_Find(ProcScr_DebugMonitor);
        debugPrintProc->unk_58++;
        sub_801BA6C(menuProc, menuItemProc);

        switch (debugPrintProc->unk_58 % 7) {
            case 0:
                SetWeather(WEATHER_FINE);
                break;
            case 1:
                SetWeather(WEATHER_SANDSTORM);
                break;
            case 2:
                SetWeather(WEATHER_SNOW);
                break;
            case 3:
                SetWeather(WEATHER_SNOWSTORM);
                break;
            case 4:
                SetWeather(WEATHER_RAIN);
                break;
            case 5:
                SetWeather(WEATHER_NIGHT);
                break;
            case 6:
                SetWeather(WEATHER_FLAMES);
                break;
        }
    }

    return 0;
}
