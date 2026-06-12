#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"

//! FE8U = 0x08089DE8
void DrawHelpBoxSaveMenuStats(void) 
{
    int level;

    const char* str = GetWMNodeNameForSaveMenu();

    if (str != 0) {
        Text_InsertDrawString(&gHelpBoxSt.text[0], 26, 7, str);
    } else {
        Text_InsertDrawString(&gHelpBoxSt.text[0], 26, 7, GetStringFromIndex(0x4C8));
    }

    level = GetLeaderLevelForSaveMenu();

    if (level >= 0) {
        Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[0], 116, 7, level);
    } else {
        Text_InsertDrawString(&gHelpBoxSt.text[0], 108, 7, GetStringFromIndex(0x4C5));
    }

    return;
}
