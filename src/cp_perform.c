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

struct UnkProcA {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 pad_2A;
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    u8 _pad1[0x58-0x34];
    /* 58 */ int unk_58;
    u8 _pad2[0x64-0x5C];
    /* 64 */ s16 unk_64;
};

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8(*func)(struct CpPerformProc* proc);
    /* 30 */ u8 unk_30;
    /* 31 */ u8 isUnitVisible;
};

void AiTargetCursor_Main(struct UnkProcA* proc);

struct ProcCmd CONST_DATA gProcScr_AiTargetCursor[] = {
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(AiTargetCursor_Main),

    PROC_END,
};

void CpPerform_UpdateMapMusic(void);
void CpPerform_MoveCameraOntoUnit(struct CpPerformProc* proc);
void CpPerform_BeginUnitMovement(struct CpPerformProc* proc);
void CpPerform_MoveCameraOntoTarget(struct CpPerformProc* proc);
void CpPerform_PerformAction(struct CpPerformProc* proc);
void CpPerform_WaitAction(struct CpPerformProc* proc);
void CpPerform_Cleanup(struct CpPerformProc* proc);
void CpPerform_EquipBest(struct CpPerformProc* proc);



s8 AiDummyAction(struct CpPerformProc*);
s8 AiEscapeAction(struct CpPerformProc*);
s8 AiWaitAndClearScreenAction(struct CpPerformProc*);

void AiTargetCursor_Main(struct UnkProcA* proc) {

    PutMapCursor(proc->unk_2C, proc->unk_30, proc->unk_58);

    if ((gKeyStatusPtr->heldKeys & (A_BUTTON | START_BUTTON)) || (proc->unk_64 > 45)) {
        Proc_Break(proc);
    }

    proc->unk_64++;

    return;
}

void StartAiTargetCursor(int x, int y, int kind, ProcPtr parent) {
    struct UnkProcA* proc;

    proc = Proc_StartBlocking(gProcScr_AiTargetCursor, parent);

    proc->unk_2C = x;
    proc->unk_30 = y;
    proc->unk_58 = kind;
    proc->unk_64 = 0;

    return;
}

void CpPerform_UpdateMapMusic() {
    if (!Proc_Find(gMusicProc3Script)) {
        StartMapSongBgm();
    }

    return;
}

void CpPerform_MoveCameraOntoUnit(struct CpPerformProc* proc) {
    proc->isUnitVisible = 1;

    if ((gPlaySt.chapterVisionRange != 0) && (gPlaySt.faction == FACTION_RED)) {
        if ((gBmMapFog[gActiveUnit->yPos][gActiveUnit->xPos] != 0) || (gBmMapFog[gAiDecision.yMove][gAiDecision.xMove] != 0)) {
            EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
        } else {
            proc->isUnitVisible = 0;

            if (gAiDecision.actionId == AI_ACTION_PILLAGE) {
                EnsureCameraOntoPosition(proc, gAiDecision.xMove, gAiDecision.yMove);
            }
        }
    } else {
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    }

    return;
}

void CpPerform_BeginUnitMovement(struct CpPerformProc* proc) {

    UnitBeginAction(gActiveUnit);

    HideUnitSprite(gActiveUnit);

    GenerateUnitMovementMap(gActiveUnit);
    SetWorkingBmMap(gBmMapMovement);

    GenerateBestMovementScript(gAiDecision.xMove, gAiDecision.yMove, gWorkingMovementScript);

    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);

    gAiDecision.xMove = gActionData.xMove;
    gAiDecision.yMove = gActionData.yMove;

    if (proc->isUnitVisible) {
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();
        SetAutoMuMoveScript(gWorkingMovementScript);
    }

    return;
}

void AiRefreshMap() {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    SetCursorMapPosition(gAiDecision.xMove, gAiDecision.yMove);
    RenderBmMapOnBg2();

    MoveActiveUnit(gAiDecision.xMove, gAiDecision.yMove);

    RefreshEntityBmMaps();
    RenderBmMap();

    NewBMXFADE(1);

    EndAllMus();
    RefreshEntityBmMaps();

    ShowUnitSprite(gActiveUnit);
    RefreshUnitSprites();

    return;
}

void AiStartCombatAction(struct CpPerformProc* proc) {

    gActionData.subjectIndex = gActiveUnitId;
    gActionData.unitActionType = UNIT_ACTION_COMBAT;
    gActionData.targetIndex = gAiDecision.targetId;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0) {
        struct Trap* trap = GetTrapAt(gAiDecision.xTarget, gAiDecision.yTarget);
        gActionData.xOther = gAiDecision.xTarget;
        gActionData.yOther = gAiDecision.yTarget;
        gActionData.trapType = trap->extra;
    }

    if ((s8)gAiDecision.itemSlot != BU_ISLOT_AUTO) {
        EquipUnitItemSlot(gActiveUnit, gAiDecision.itemSlot);
        gActionData.itemSlotIndex = 0;
    } else {
        gActionData.itemSlotIndex = BU_ISLOT_BALLISTA;
    }

    ApplyUnitAction(proc);

    return;
}

void AiStartEscapeAction(struct CpPerformProc* proc) {
    u8 scripts[4][3] = {
        { MOVE_CMD_MOVE_LEFT,  MOVE_CMD_MOVE_LEFT,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_RIGHT, MOVE_CMD_MOVE_RIGHT, MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_DOWN,  MOVE_CMD_MOVE_DOWN,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_UP,    MOVE_CMD_MOVE_UP,    MOVE_CMD_HALT },
    };

    if ((gAiDecision.xTarget != 5) && (proc->isUnitVisible)) {
        SetAutoMuMoveScript(scripts[gAiDecision.xTarget]);
    }

    return;
}

void AiStartStealAction(struct CpPerformProc* proc) {
    struct Unit* unit = GetUnit(gAiDecision.targetId);

    u16 item = unit->items[gAiDecision.itemSlot];

    UnitAddItem(gActiveUnit, item);
    UnitRemoveItem(unit, gAiDecision.itemSlot);

    NewPopup_ItemStealing(item, proc);

    return;
}
