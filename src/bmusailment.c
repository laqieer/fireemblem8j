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

void StatusHealEffect_PalSpriteAnim_Init(struct UnknownBMUSAilmentProc* proc) {
    u16* pal = NULL;

    switch (UNIT_FACTION(gActiveUnit)) {
        case FACTION_BLUE:
            pal = &PAL_OBJ_COLOR(12, 0);
            break;

        case FACTION_RED:
            pal = &PAL_OBJ_COLOR(13, 0);
            break;

        case FACTION_GREEN:
            pal = &PAL_OBJ_COLOR(14, 0);
            break;
    }

    ApplyPalette(pal, 0x12);

    proc->unk_4C = 0;

    return;
}

void StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(struct UnknownBMUSAilmentProc* proc, int intensity) {
    if (intensity > 31) {
        intensity = 31;
    }

    if (intensity < 0) {
        intensity = 0;
    }

    PAL_OBJ_COLOR(2, 15) = (intensity << 10) + (intensity << 5) + intensity;

    EnablePaletteSync();

    return;
}

void StatusHealEffect_PalSpriteAnim_LoopIn(struct UnknownBMUSAilmentProc* proc) {

    StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(proc, proc->unk_4C);
    
    proc->unk_4C++;

    if (proc->unk_4C == 32) {
        Proc_Break(proc);
    }

    return;
}
