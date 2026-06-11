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

//! FE8U = 0x080B7614
void EndingDetails_LoopFog(struct EndingTurnRecordProc * proc)
{
    int x;
    int y;

    proc->unk_4c++;

    y = proc->unk_4c;
    x = y * 3;

    BG_SetPosition(BG_2, x / 8, y / 4);

    return;
}
