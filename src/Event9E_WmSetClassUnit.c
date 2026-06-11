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

//! FE8U = 0x0800C55C
u8 Event9E_WmSetClassUnit(struct EventEngineProc * proc)
{
    u16 muId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 allegiance = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    SetGmClassUnit(muId, jid, allegiance, nodeId);

    return EVC_ADVANCE_CONTINUE;
}
