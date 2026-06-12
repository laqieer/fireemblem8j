#include "global.h"
#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "hardware.h"
#include "bmtrap.h"
#include "playerphase.h"
#include "popup.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "cp_perform.h"
#include "constants/terrains.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct PopupInstruction PopupScr_CpPerform_0[];

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8(*func)(struct CpPerformProc* proc);
    /* 30 */ u8 unk_30;
    /* 31 */ u8 isUnitVisible;
};

s8 AiPillageAction(struct CpPerformProc* proc) {

    int x = gAiDecision.xMove;
    int y = gAiDecision.yMove;

    if (gBmMapTerrain[y][x] == TERRAIN_CHEST_FULL) {
        gActiveUnit->xPos = gAiDecision.xMove;
        gActiveUnit->yPos = gAiDecision.yMove;

        gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
        gAiDecision.itemSlot = gAiDecision.itemSlot; // dummy
        gActionData.itemSlotIndex = gAiDecision.itemSlot;

        ActionStaffDoorChestUseItem(proc);
    } else {
        s8 y2 = y - 1;
        StartAvailableTileEvent((s8)x, y2);

        PlaySoundEffect(SONG_AB);

        NewPopup_Simple(PopupScr_CpPerform_0, 0x60, 0, proc);
    }

    return 1;
}
