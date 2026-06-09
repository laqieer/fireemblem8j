#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo *info, int index);
int GetCurerentGameMode(void);

void SavePlayThroughData(void)
{
    struct GlobalSaveInfo info;
    int mode, difficult, isTutorial;
    
    mode = GetCurerentGameMode();

    /* Maybe flag definition should be modified? */
    difficult = !!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD);

    isTutorial = gPlaySt.config.controller;

    if (!ReadGlobalSaveInfo(&info)) {
        InitGlobalSaveInfodata();
        ReadGlobalSaveInfo(&info);
    }

    RegisterCompletedPlaythrough(&info, gPlaySt.playthroughIdentifier);
    info.completed  = true;

    switch (mode) {
    case CHAPTER_MODE_EIRIKA:
        if (!isTutorial)
            info.Eirk_mode_easy = true;
        else if (difficult)
            info.Eirk_mode_hard = true;
        else
            info.Eirk_mode_norm = true;
        break;
    
    case CHAPTER_MODE_EPHRAIM:
        if (!isTutorial)
            info.Ephy_mode_easy = true;
        else if (difficult)
            info.Ephy_mode_hard = true;
        else
            info.Ephy_mode_norm = true;
        break;

        
    case CHAPTER_MODE_COMMON:
    default:
        break;
    }

    WriteGlobalSaveInfo(&info);
}
