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

void ArenaUi_ResultsDialogue(ProcPtr proc) {
    u32 partyGold = GetPartyGoldAmount();

    switch (ArenaGetResult()) {
        case 1:
            SetTalkNumber(ArenaGetMatchupGoldValue() * 2);
            StartArenaDialogue(0x876, proc);
            // TODO: msgid "So you won, eh? Here's[NL]your prize. [G] gold.[A]"

            SetPartyGoldAmount(partyGold = partyGold + (ArenaGetMatchupGoldValue() * 2));

            break;

        case 2:
            StartArenaDialogue(0x877, proc);
            // TODO: msgid "Ahh, you lost? I'd hoped[NL]for better from you.[A]"

            break;

        case 3:
            StartArenaDialogue(0x879, proc);
            // TODO: msgid "Looks like no one wins.[.][NL]Here's your money back.[.][A]"
            SetPartyGoldAmount(partyGold = partyGold + ArenaGetMatchupGoldValue());

            break;

        case 4:
            // _080B5B88
            StartArenaDialogue(0x878, proc);
            // TODO: msgid "What? You yield? Well,[NL]your gold is mine, then![A]"
            break;
    }

    return;
}
