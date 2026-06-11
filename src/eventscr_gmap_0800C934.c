#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"

#include "eventscript.h"
#include "event.h"

void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);
int IsWmPlaceDotActiveAtIndex(int);

//! FE8U = 0x0800C65C
u8 EventA6_WmUnitSetOnNode(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    gGMData.units[unitId].location = nodeId;

    GmMu_SetNode(GM_MU, unitId, nodeId);

    return EVC_ADVANCE_CONTINUE;
}
