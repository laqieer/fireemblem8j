#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"




void WriteLastGameSaveId(int num)
{
    struct GlobalSaveInfo info;

    ReadGlobalSaveInfo(&info);
    info.last_game_save_id = num;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int ReadLastGameSaveId()
{
    int ret;
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;
    
    ret = info.last_game_save_id;

    if (ret > SAVE_ID_GAME2)
        return SAVE_ID_GAME0;
    else if (ret < 0)
        return SAVE_ID_GAME0;
    else
        return ret;
}
