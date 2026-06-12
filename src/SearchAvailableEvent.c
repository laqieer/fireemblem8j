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
/* TU-private data externs bound at their JP addresses */
extern struct EventListCmdInfo gEventListCmdInfoTable[];

#define EVT_CMD_LO(cmd) (((cmd) & 0x0000FFFF))
#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)

struct EventInfo * SearchAvailableEvent(struct EventInfo * info)
{
    int * len;
    struct EventListCmdInfo * cmdInfo;

    info->script = 0;
    info->flag = 0;

    cmdInfo = gEventListCmdInfoTable;
    len = &cmdInfo[0].length;

    for (;;)
    {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        int r6 = cmdId;

        if (!CheckFlag(EVT_CMD_HI(info->listScript[0])))
        {
            if (cmdInfo[cmdId].func(info) == 1)
            {
                goto _end; // FIXME: Goto appears to be required for match
            }
        }

        info->listScript += len[r6 << 1];
    }

_end:
    if (info->script)
        return info;
    return NULL;
}
