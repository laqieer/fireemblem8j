#include "global.h"
#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "event.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

struct EvCheck01 {
    u32 unk0;
    u32 script;
    u32 unk8;
};
struct EvCheck02 {
    u32 unk0;
    u32 script;
    u8 turn;
    u8 maxTurn;
    u16 faction;
};

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)

//! FE8U = 0x080837F8
s8 CheckTradeTutorial(void) {
    int ret = 0;

    if (TUTORIAL_MODE()) {
        ret = CheckFlag(0x87) != 0;
    }

    return ret;
}

//! FE8U = 0x08083830
int EvCheck00_Always(struct EventInfo* info) {
    return 1;
}

//! FE8U = 0x08083834
int EvCheck01_AFEV(struct EventInfo* info) {
    struct EvCheck01* listScript = (void *)info->listScript;

    if ((listScript->unk8 == 0) || (listScript->unk8 == 100) || (CheckFlag(listScript->unk8) == 1)) {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083864
int EvCheck02_TURN(struct EventInfo* info) {
    struct EvCheck02* listScript = (void *)info->listScript;

    int turn = listScript->turn;
    int maxTurn = listScript->maxTurn;
    int faction = listScript->faction;

    if (maxTurn == 0) {
        maxTurn = turn;
    } else if (maxTurn == 0xff) {
        maxTurn = INT32_MAX;
    }


    if ((turn <= gPlaySt.chapterTurnNumber) && (gPlaySt.chapterTurnNumber <= maxTurn) && (gPlaySt.faction == faction)) {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);

        return 1;
    }

    return 0;
}
