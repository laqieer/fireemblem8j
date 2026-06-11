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

struct EvCheck04 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    s8 (*func)(void *);
};

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)

//! FE8U = 0x080838FC
int EvCheck04_CHARASM(struct EventInfo* info) {
    struct EvCheck04 *listScript = (void *)info->listScript;

    int pidA = listScript->pidA;
    int pidB = listScript->pidB;

    if ((listScript->func(info) != 0) && (info->pidA == pidA || (pidA == 0)) && (info->pidB == pidB)) {
        info->script = listScript->script;
        info->flag = listScript->unk0 >> 16; // EVT_CMD_HI causes regswap
        return 1;
    }

    return 0;
}
