#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

int GetManimLevelUpStatGain(int actor_id, int stat_num)
{
    switch (stat_num) {
    case 0:
        return 1;

    case 1:
        return gManimSt.actor[actor_id].bu->changeHP;

    case 2:
        return gManimSt.actor[actor_id].bu->changePow;

    case 3:
        return gManimSt.actor[actor_id].bu->changeSkl;

    case 4:
        return gManimSt.actor[actor_id].bu->changeSpd;

    case 5:
        return gManimSt.actor[actor_id].bu->changeLck;

    case 6:
        return gManimSt.actor[actor_id].bu->changeDef;

    case 7:
        return gManimSt.actor[actor_id].bu->changeRes;

    case 8:
        return gManimSt.actor[actor_id].bu->changeCon;

    default:
        return 0;
    }
}
