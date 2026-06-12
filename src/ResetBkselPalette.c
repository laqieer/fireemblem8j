#include "global.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "event.h"
#include "hardware.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmmap.h"
#include "bksel.h"
#include "chapterdata.h"

//! FE8U = 0x0800BB98
void ResetBkselPalette(void)
{
    s8 found = Proc_Find(gProcScr_BKSEL) != NULL;

    if (found)
        InitBattleForecastFramePalettes();
}
