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
/* TU-private data externs bound at their JP addresses */
extern struct PopupInstruction gSioBattlemap_4[];
extern struct PopupInstruction gSioBattlemap_5[];

//! FE8U = 0x0804AAFC
void LABattleMap_ReceiveAttackDeclaration(struct SioProc85AA4CC * proc)
{
    u8 buf[4];

    u16 got = SioReceiveData(gUnk_45, buf, LABattleMap_IsAttackOrSurrenderMsg);

    if (got != 0)
    {
        switch (gUnk_45[0])
        {
            case 1:
                LinkArenaBattleMap_StartUnitMoveOut(gUnk_45[1], 0, &gUnk_Sio_16.unk_04, &proc->unk_2c, &proc->unk_30);
                Proc_Goto(proc, 1);

                break;

            case 6:
                EndLinkArenaPointsBox();
                SioStrCpy(gUnk_Sio_9[buf[0]], gUnk_48);
                NewPopup_Simple(gSioBattlemap_4, 0x60, 0, 0);

                Proc_Goto(proc, 3);

                break;

            case 7:
                EndLinkArenaPointsBox();
                NewPopup_Simple(gSioBattlemap_5, 0x60, 0, 0);

                Proc_Goto(proc, 4);

                break;
        }
    }

    LABattleMap_PollSurrenderInput();

    return;
}
