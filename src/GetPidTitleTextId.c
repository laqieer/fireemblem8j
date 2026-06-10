#include "global.h"
#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"
#include "ending_details.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

extern struct EndingTitleEnt gCharacterEndingTitleLut[];

//! FE8U = 0x080B6720
int GetPidTitleTextId(int pid)
{
    struct EndingTitleEnt * ent;

    for (ent = gCharacterEndingTitleLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
        {
            return ent->titleTextId;
        }
    }

    return 0;
}
