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

//! FE8U = 0x080847F8
struct SupportTalkEnt* GetSupportTalkList(void) {
    return gSupportTalkList;
}

//! FE8U = 0x08084800
bool IsCharacterForceDeployed_(u16 pid)
{
    struct ForceDeploymentEnt * it;

    for (it = gForceDeploymentList; it->pid != (u16)-1; it++)
    {
        if (it->route != 0xFF && it->route != gPlaySt.chapterModeIndex)
            continue;

        if (it->chapter != 0xFF && it->chapter != gPlaySt.chapterIndex)
            continue;

        if (pid != it->pid)
            continue;

        return true;
    }
    return false;
}

//! FE8U = 0x08084858
int IsSethLArachelMyrrhInnes(u16 pid)
{
    u8 * it;

    for (it = gPidList_SethLArachelMyrrhInnes; *it != CHARACTER_NONE; it++)
        if (*it == pid)
            return true;

    return false;
}
