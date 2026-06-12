#include "global.h"
#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"

void ClassInfoDisplay_ExecScript(struct OpInfoClassDisplayProc* proc) {
    switch (proc->script->opCode) {
        case CLASS_REEL_OP_0:
            Proc_Goto(proc, 10);

            break;

        case CLASS_REEL_OP_1:
            gOpInfoData.roundType = ANIM_ROUND_HIT_CLOSE;
            RestartMainMiniAnim(&gOpInfoData);

            break;

        case CLASS_REEL_OP_2:
            gOpInfoData.roundType = ANIM_ROUND_CRIT_CLOSE;
            RestartMainMiniAnim(&gOpInfoData);

            break;

        case CLASS_REEL_OP_3:
        case CLASS_REEL_OP_7:
            ApplyMainMiniAnimHitEffect(&gOpInfoData);

            break;

        case CLASS_REEL_OP_4:
            gOpInfoData.roundType = ANIM_ROUND_NONCRIT_FAR;
            RestartMainMiniAnim(&gOpInfoData);

            break;

        case CLASS_REEL_OP_6:
            gOpInfoData.roundType = ANIM_ROUND_TAKING_MISS_CLOSE;
            RestartMainMiniAnim(&gOpInfoData);

            break;

        case CLASS_REEL_OP_5:
        case CLASS_REEL_OP_8:
            break;
    }

    proc->unk_2a = 0;

    return;
}
