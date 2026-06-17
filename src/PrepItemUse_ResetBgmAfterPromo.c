#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"



bool CheckInLinkArena(void);

void PrepItemUse_ResetBgmAfterPromo(struct ProcPrepItemUse * proc)
{
    Sound_SetSEVolume(0x100);

    if (CheckInLinkArena()) {
        OverrideBgm(SONG_COLOSSEUM_ENTRANCE);
        return;
    }
    
    if (gGMData.state.bits.state_0) {
        MakeBgmOverridePersist();
        UpdateWorldMapBgm();
        return;
    }

    OverrideBgm(SONG_COMBAT_PREPARATION);
}
