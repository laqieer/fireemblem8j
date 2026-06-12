#include "global.h"
#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080B9F54
void WorldMap_UpdateBgm(ProcPtr unused)
{
    int mapLocation;
    int songId;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
    {
        songId = SONG_RAY_OF_HOPE;
    }
    else
    {
        mapLocation = GetNextUnclearedNode(&gGMData);

        if (mapLocation >= 0)
        {
            switch (gPlaySt.chapterModeIndex)
            {
                case CHAPTER_MODE_COMMON:
                case CHAPTER_MODE_EIRIKA:
                default:
                    songId = gWMSongTable[mapLocation].eirika;
                    break;

                case CHAPTER_MODE_EPHRAIM:
                    songId = gWMSongTable[mapLocation].ephraim;
                    break;
            }
        }
        else
        {
            songId = SONG_THE_BEGINNING;
        }
    }

    if (GetCurrentBgmSong() != songId)
    {
        OverrideBgm(songId);
    }

    return;
}
