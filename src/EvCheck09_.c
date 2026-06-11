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

struct EvCheck08 {
    u32 unk0;
    u32 script;
    u32 unk8;
};

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

//! FE8U = 0x08083A10
int EvCheck09_(struct EventInfo* info) {
    struct EvCheck08* listScript = (void *)info->listScript;

    int x = EVT_CMD_B1(listScript->unk8);
    int y = EVT_CMD_B2(listScript->unk8);
    int tileCommand = EVT_CMD_B3(listScript->unk8);
    int givenMoney = EVT_CMD_B4(listScript->unk8);

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript->script;
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(((struct EvCheck08 *)info->listScript)->unk0);

        info->commandId = tileCommand;
        info->givenMoney = givenMoney;

        return 1;
    }

    return 0;
}
