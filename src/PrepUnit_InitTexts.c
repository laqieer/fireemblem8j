#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

void PrepUnit_InitTexts()
{
    int i;

    ResetText();

    /* 0x00 ~ 0x0D (size = 14): unit name */
    for (i = 0; i < 14; i++)
        InitText(&gPrepUnitTexts[i], 5);
    
    /* 0x0E ~ 0x12 (size = 5):  item name */
    for (i = 0; i < 5; i++)
        InitText(&gPrepUnitTexts[i + 0xE], 7);
    
    InitText(&gPrepUnitTexts[0x13], 7);
    InitText(&gPrepUnitTexts[0x14], 10);
    InitText(&gPrepUnitTexts[0x15], 11);
}
