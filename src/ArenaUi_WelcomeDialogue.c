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

void ArenaUi_WelcomeDialogue(ProcPtr proc) {
    if (UNIT_ARENA_LEVEL(gArenaState.playerUnit) < 5) {
        StartArenaDialogue(0x870, proc);
        // TODO: msgid "Welcome to the arena![.][A]"
    } else {
        StartArenaDialogue(0x871, proc);
        // TODO: msgid "Welcome to the arena.[.][A][NL]Oh! It's you again.[.][A][NL2][NL]I've lost a lot of gold[.][NL]thanks to you...[A][NL2][NL]If you want to continue,[A][NL]we're going to have to[NL]do things differently.[A][NL2][NL]I'm going to prepare some[.][NL]more challenging foes.[A]"
    }

    return;
}
