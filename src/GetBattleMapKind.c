#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080BD068
u32 GetBattleMapKind(void)
{
    int i;
    u32 chapterId = gPlaySt.chapterIndex;

    switch (chapterId)
    {
        case CHAPTER_L_2:
        case CHAPTER_L_3:
        case CHAPTER_L_4:
        case CHAPTER_L_5:
        case CHAPTER_L_6:
        case CHAPTER_L_7:
        case CHAPTER_L_8:
        case CHAPTER_E_9:
        case CHAPTER_E_10:
        case CHAPTER_E_13:
        case CHAPTER_E_14:
        case CHAPTER_E_15:
        case CHAPTER_E_16:
        case CHAPTER_E_17:
        case CHAPTER_E_18:
        case CHAPTER_E_19:
        case CHAPTER_E_20:
        case CHAPTER_I_9:
        case CHAPTER_I_10:
        case CHAPTER_I_13:
        case CHAPTER_I_14:
        case CHAPTER_I_15:
        case CHAPTER_I_16:
        case CHAPTER_I_17:
        case CHAPTER_I_18:
        case CHAPTER_I_19:
        case CHAPTER_I_20:
        case CHAPTER_T_01:
        case CHAPTER_T_02:
        case CHAPTER_T_03:
        case CHAPTER_T_04:
        case CHAPTER_T_05:
        case CHAPTER_T_06:
        case CHAPTER_T_07:
        case CHAPTER_T_08:
        case CHAPTER_2C:
        case CHAPTER_2D:
        case CHAPTER_R_01:
        case CHAPTER_R_02:
        case CHAPTER_R_03:
        case CHAPTER_R_04:
        case CHAPTER_R_05:
        case CHAPTER_R_06:
        case CHAPTER_R_07:
        case CHAPTER_R_08:
        case CHAPTER_R_09:
        case CHAPTER_R_10:
        case CHAPTER_MALKAEN_COAST:
        case CHAPTER_3A:
        case CHAPTER_E_11:
        case CHAPTER_I_11:
        default:
            if (CHAPTER_IS_TOWER(chapterId))
            {
                chapterId = CHAPTER_T_01;
            }
            else if (CHAPTER_IS_RUINS(chapterId))
            {
                chapterId = CHAPTER_R_01;
            }

            for (i = 0; i < NODE_MAX; i++)
            {
                if (chapterId == WMLoc_GetChapterId(i))
                {
                    if (!(gGMData.nodes[i].state & GM_NODE_STATE_CLEARED))
                    {
                        if ((u8)i[gWMNodeData].encounters != 3)
                        {
                            break;
                        }
                    }
                    else if (i[gWMNodeData].placementFlag != GMAP_NODE_PLACEMENT_DUNGEON)
                    {
                        return BATTLEMAP_KIND_STORY;
                    }

                    return BATTLEMAP_KIND_DUNGEON;
                }
            }

            break;

        case CHAPTER_L_PROLOGUE:
        case CHAPTER_L_1:
        case CHAPTER_L_5X:
        case CHAPTER_E_12:
        case CHAPTER_E_21:
        case CHAPTER_E_21X:
        case CHAPTER_I_12:
        case CHAPTER_I_21:
        case CHAPTER_I_21X:
        case CHAPTER_CASTLE_FRELIA:
        case CHAPTER_3B:
        case CHAPTER_3C:
        case CHAPTER_3F:
        case CHAPTER_40:
        case CHAPTER_41:
        case CHAPTER_42:
        case CHAPTER_43:
        case CHAPTER_44:
        case CHAPTER_45:
        case CHAPTER_46:
        case CHAPTER_47:
            return BATTLEMAP_KIND_STORY;
    }

    return BATTLEMAP_KIND_SKIRMISH;
}
