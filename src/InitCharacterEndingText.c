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



extern struct Text *  gpCharacterEndingTexts;

void InitCharacterEndingText(void)
{
    int i;

    ResetText();

    for (i = 0; i < 2; i++)
    {
        InitText(gpCharacterEndingTexts + 5 + i, 15);
        InitText(gpCharacterEndingTexts + 7 + i, 10);
    }

    for (i = 0; i < 5; i++)
    {
        InitText(gpCharacterEndingTexts + i, 25);
    }

    return;
}
