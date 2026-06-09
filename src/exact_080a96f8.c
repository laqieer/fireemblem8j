#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





s8 CheckGameEndFlag()
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info))
        return info.game_end;
    else
        return 0;
}
