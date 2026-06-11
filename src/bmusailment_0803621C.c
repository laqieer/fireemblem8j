#include "global.h"

#include "constants/classes.h"
#include "constants/items.h"

#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiselecttarget.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmmind.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "trapfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bmusailment.h"
#include "constants/songs.h"

extern u16 gUnkData_40[];
extern u16 gUnkData_41[]; // palette
extern u16 gUnkData_42[];

// code_mapanim.s
void BeginMapAnimForPoisonDmg(void);
void BeginMapAnimForEggDmg(void);
void BeginMapAnimForCritAtk(void);


struct UnknownBMUSAilmentProc {
    PROC_HEADER;

    /* 29 */ u8 _pad1[0x2C-0x29];
    /* 2C */ int unk_2C;
    /* 30 */ int _pad2;
    /* 34 */ int unk_34;
    /* 38 */ u8 _pad3[0x4C-0x38];

    /* 4C */ s16 unk_4C;
    /* 4E */ u8 _pad4[0x58-0x4E];

    /* 58 */ int unk_58;
};

/* prototypes for same-file helpers called by this run */
void ApplyHazardHealing(ProcPtr proc, struct Unit* unit, int hp, int status);
void BeginUnitPoisonDamageAnim(struct Unit* unit, int damage);
void BeginUnitCritDamageAnim(struct Unit* unit, int damage);
void StartStatusHealEffect(struct Unit* unit, ProcPtr proc);

void GorgonEggHatchDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    ApplyHazardHealing(proc, unit, target->extra, -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) == 0) {
        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }
    }

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) < 1) {
        RefreshUnitSprites();
    }

    return;
}

void StatusDecayDisplay_Init(struct UnknownBMUSAilmentProc* proc) {
    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
        proc->unk_58 = 0;
    }

    return;
}

void StatusDecayDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    int status = GetUnit(gActionData.subjectIndex)->statusIndex;

    proc->unk_58 = status;

    SetUnitStatus(GetUnit(gActionData.subjectIndex), UNIT_STATUS_NONE);

    switch (status) {
        case UNIT_STATUS_POISON:
        case UNIT_STATUS_SLEEP:
        case UNIT_STATUS_SILENCED:
        case UNIT_STATUS_BERSERK:
        case UNIT_STATUS_RECOVER:
        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            StartStatusHealEffect(GetUnit(target->uid), proc);
            break;
    }

    return;
}

void StatusDecayDisplay_Next(struct UnknownBMUSAilmentProc* proc) {

    if ((proc->unk_58 == UNIT_STATUS_PETRIFY) || (proc->unk_58 == UNIT_STATUS_13)) {
        SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);
        GetUnit(gActionData.subjectIndex)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        EndAllMus();
    }

    SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);

    proc->unk_4C++;

    return;
}

void TrapDamageDisplay_Init(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 0;
    return;
}

void TrapDamageDisplay_Check(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    gActionData.subjectIndex = target->uid;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_End(proc);
        return;
    }

    if (target->uid == 0) {
        return;
    }

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0)) {
        Proc_Goto(proc, 1);
    } else {
        if (GetUnitCurrentHp(unit) == 0) {
            Proc_Goto(proc, 1);
        }
    }

    return;
}

void TrapDamageDisplay_Watch(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid != 0 || target->extra != 6) {
        EnsureCameraOntoPosition(proc, target->x, target->y);
    }

    return;
}

void TrapDamageDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid == 0) {
        switch (target->extra) {
            case TRAP_FIRETILE:
                StartFireTrapAnim(proc, target->x, target->y);
                break;

            case 0x64:
                StartGasTrapAnim(proc, target->x, target->y, 3);
                break;

            case 0x65:
                StartGasTrapAnim(proc, target->x, target->y, 2);
                break;

            case 0x66:
                StartGasTrapAnim(proc, target->x, target->y, 0);
                break;

            case 0x67:
                StartGasTrapAnim(proc, target->x, target->y, 1);
                break;

            case TRAP_LIGHTARROW:
                StartArrowTrapAnim(proc, target->x);
                break;

            case TRAP_MAPCHANGE2:
                StartShowMapChangeAnim(proc, target->x, target->y);
                break;
        }

        proc->unk_4C++;

        Proc_Goto(proc, 0);
    } else {
        gActionData.subjectIndex = target->uid;
        gActionData.trapType = target->extra;

        HideUnitSprite(GetUnit(gActionData.subjectIndex));

        if (gActionData.trapType < 6) {
            BeginUnitPoisonDamageAnim(GetUnit(gActionData.subjectIndex), target->extra);
        } else {
            BeginUnitCritDamageAnim(GetUnit(gActionData.subjectIndex), target->extra);
        }
    }

    return;
}
