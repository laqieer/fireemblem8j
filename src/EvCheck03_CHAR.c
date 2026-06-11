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

struct EvCheck03 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    u16 fillerA;
    u16 unkC;
    u16 unkE;
};

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)

//! FE8U = 0x080838AC
int EvCheck03_CHAR(struct EventInfo* info) {
    struct EvCheck03 * listScript = (void *)info->listScript;

    int pidA = listScript->pidA;
    int pidB = listScript->pidB;
    int unk = listScript->unkC;

    switch (unk) {
    case 1:
        return false;
    case 2:
        return false;
    case 3:
        if ((CheckFlag(listScript->unkE) == 0))
            return false;

        break;
    }

    if (((info->pidA == pidA) || (pidA == 0)) && info->pidB == pidB)
    {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);
        return true;
    }
    return false;
}
