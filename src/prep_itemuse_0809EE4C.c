#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

bool CheckInLinkArena(void);

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse * proc)
{
    EndMuralBackground_();
    ResetText();
    SetupBackgrounds(NULL);
    EndGreenText();

    /**
     * Although it is not a bad idea to detect game lock level
     * to trigger banim done, but it also need to take risks for
     * unexpected configuration.
     *
     * So I think this is the reason why such routine is abandoned.
     *
     * BTW, branched-promotion maybe the new requirements introduced
     * later during the game development, and then the developers
     * replaced such routine to branched-promotion handler.
     *
     *          -------- from Mokha's conjecture wwwww
     */
    proc->game_lock = GetGameLock();

    ResetFaces();
    EndHelpPromptSprite();

    SetWinEnable(0, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(0, 0, 0, 8);
    EndSysBrownBox();
    EndAllParallelWorkers();
    EndFaceById(0);

    ClearUiCursorHandConfig(0);
    ExecUnitPromotion(proc->unit, CLASS_EPHRAIM_LORD, proc->slot, false);
    gBattleStats.config = 0x110;
    BeginBattleAnimations();
}
