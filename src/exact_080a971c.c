#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





void SetGameEndFlag()
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info)) {
        info.game_end = 1;
        WriteGlobalSaveInfo(&info);
    }
}
