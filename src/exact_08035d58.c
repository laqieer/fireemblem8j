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

void StatusHealEffect_BlendSpriteAnim_InitIn(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 0;
    proc->unk_34 = 1;

    return;
}
