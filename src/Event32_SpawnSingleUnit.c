#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "event.h"
#include "eventscript.h"
#include "eventinfo.h"

//! FE8U = 0x0800FFF8
u8 Event32_SpawnSingleUnit(struct EventEngineProc * proc)
{
    struct UnitDefinition unitDef;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    int pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    int x = (s8)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    int y = EVT_CMD_ARGV(proc->pEventCurrent)[1] >> 8;

    if (pid == -3)
    {
        pid = (s16)gEventSlots[2];
    }

    if ((x < 0) || (y < 0))
    {
        x = (s8)((s16 *)(gEventSlots + 0xB))[0];
        y = (s8)((s16 *)(gEventSlots + 0xB))[1];
    }

    unitDef.charIndex = pid;
    unitDef.classIndex = gCharacterData[pid - 1].defaultClass;
    unitDef.leaderCharIndex = 0;

    unitDef.autolevel = 0;
    unitDef.allegiance = subcmd == 0xF ? 0 : subcmd;
    unitDef.level = gCharacterData[pid - 1].baseLevel;

    unitDef.xPosition = x;
    unitDef.yPosition = y;

    unitDef.genMonster = 0;

    unitDef.itemDrop = 1;
    unitDef.sumFlag = 0;
    unitDef.unk_05_7 = 0;
    unitDef.extraData = 0;

    unitDef.redaCount = 0;

    unitDef.redas = NULL;

    unitDef.items[0] = 0;
    unitDef.items[1] = 0;
    unitDef.items[2] = 0;
    unitDef.items[3] = 0;

    unitDef.ai[UDEF_AIIDX_AI_A] = 0;
    unitDef.ai[UDEF_AIIDX_AI_B] = 0;
    unitDef.ai[UDEF_AIIDX_AI_CONF_L] = 0;
    unitDef.ai[UDEF_AIIDX_AI_CONF_H] = 0;

    LoadUnit_0(&unitDef, 0, 0, subcmd == 0xf);

    return EVC_ADVANCE_CONTINUE;
}
