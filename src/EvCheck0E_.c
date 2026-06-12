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

struct EvCheck0E {
    u32 unk0;
    u32 script;
    s8 (*func)(struct EventInfo*);
};

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)

//! FE8U = 0x08083B2C
int EvCheck0E_(struct EventInfo* info) {
    if (((struct EvCheck0E *)info->listScript)->func(info) != 0) {
        info->script = ((struct EvCheck0E *)info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0E *)info->listScript)->unk0);
        return 1;
    }

    return 0;
}
