#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

void SioUpdateTeam(char * str, int team)
{
    int i;
    struct Unit * buffer = GetUnit(FACTION_RED + 1);
    for (i = 0; i < 5; i++)
        ClearUnit(buffer + i);

    for (i = 0; i < 5; i++)
    {
        u8 pid = gSioPidPool.pids[i];
        if (pid != 0)
        {
            struct Unit * unit = GetUnitFromCharId(pid);
            if (!(unit->state & US_NOT_DEPLOYED))
            {
                SetUnitStatus(unit, UNIT_STATUS_NONE);
                unit->state = 0;
                MemCpy(unit, buffer + i, sizeof(struct Unit));
            }
        }
    }
    WriteMultiArenaSaveTeam(team, buffer, str);
}
