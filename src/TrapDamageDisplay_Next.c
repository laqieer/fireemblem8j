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

void TrapDamageDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 6) {
        ApplyHazardHealing(proc, unit, -(target->extra), UNIT_STATUS_POISON);
    } else {
        ApplyHazardHealing(proc, unit, -(target->extra), -1);
    }

    if (GetUnitCurrentHp(unit) <= 0) {
        RefreshUnitSprites();
    }

    proc->unk_4C++;

    return;
}
