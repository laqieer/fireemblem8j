#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"
#include "constants/songs.h"



void StartArenaDialogue(int msgId, ProcPtr proc);

void ArenaUi_CheckConfirmation(ProcPtr proc) {

    if (GetTalkChoiceResult() != 1) {
        StartArenaDialogue(0x874, proc);
        // TODO: msgid "What's that? Bah![.][NL]Get outta here![.][A]"
        Proc_Goto(proc, 2);
    } else {
        if (ArenaGetMatchupGoldValue() > (int)GetPartyGoldAmount()) {
            StartArenaDialogue(0x87A, proc);
            // TODO: msgid "You don't have the money![.][NL]Try again later.[A]"
            Proc_Goto(proc, 2);
        }
    }

    return;
}
