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

void CpPerform_EquipBest(struct CpPerformProc* proc) {
    u16 equip_flags[UNIT_ITEM_COUNT + 1];

    if (AiCanEquip() && AiEquipGetFlags(equip_flags))
    {
        u16 range_danger;
        u16 melee_danger;
        u16 combined_danger;

        AiEquipGetDanger(gAiDecision.xMove, gAiDecision.yMove, &range_danger, &melee_danger, &combined_danger);
        AiEquipBestConsideringDanger(range_danger, melee_danger, combined_danger, equip_flags);
    }
}
