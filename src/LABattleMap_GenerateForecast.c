#include "global.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

//! FE8U = 0x0804A298
void LABattleMap_GenerateForecast(struct SioProc85AA1AC * proc)
{
    int tmp = 0;
    int local_24 = +1;

    struct Unit * unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
    struct Unit * unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

    if (proc->unk_64 == GetGameLock())
    {
        int y = unitB->yPos + 1;

        if (gBmMapTerrain[y][unitB->xPos] != TERRAIN_FLOOR_REGULAR)
        {
            local_24 = -1;
        }

        if (gUnk_Sio_16.unk_06 == 0)
        {
            LinkArenaBattleMap_RestoreUnitItems(gActiveUnit);
            Proc_Goto(proc, 0);
        }
        else
        {
            EquipUnitItemSlot(gActiveUnit, gUnk_Sio_16.unk_07);

            if ((unitB->state & US_BIT9) == 0)
            {
                NewBattleForecast(proc);
                tmp = (gUnk_Sio_16.unk_06 == 2) ? 1 : 0;
                BattleGenerateSimulation(unitA, unitB, unitB->xPos + tmp, unitB->yPos + local_24, 0);
                UpdateBattleForecastContents();
                LinkArenaBattleMap_RestoreUnitItems(gActiveUnit);
                Proc_Break(proc);
            }
            else
            {
                LinkArenaBattleMap_RestoreUnitItems(gActiveUnit);
                Proc_Goto(proc, 1);
            }
        }
    }
    return;
}
