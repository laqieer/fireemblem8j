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

void RenderMapForFogFadeIfUnitDied(struct Unit* unit) {

    if ((GetUnitCurrentHp(unit) == 0) && (gPlaySt.chapterVisionRange != 0)) {
        RenderBmMapOnBg2();
    }

    return;
}

void BeginUnitHealAnim(struct Unit* unit, int hp) {

    BattleInitItemEffect(unit, -1);

    gBattleActor.weapon = ITEM_VULNERARY;
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    AddUnitHp(&gBattleActor.unit, hp);

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    BattleHitTerminate();
    BeginBattleAnimations();

    return;
}

void BeginUnitPoisonDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForPoisonDmg();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void BeginGorgonEggHatchDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {

        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForEggDmg();

    return;
}

void BeginUnitCritDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {

        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_CRIT;
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForCritAtk();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void KillAllRedUnits_Init(struct UnknownBMUSAilmentProc* proc) {
    int i;

    InitTargets(0, 0);

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_UNAVAILABLE) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
    }

    proc->unk_4C = 0;

    return;
}

void KillAllRedUnits_Loop(struct UnknownBMUSAilmentProc* proc) {
    struct Unit* unit;
    int x;
    int y;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_Goto(proc, 99);
        return;
    }

    unit = GetUnit(GetTarget(proc->unk_4C)->uid);

    HideUnitSprite(unit);
    UnitKill(unit);

    x = unit->xPos * 16 - gBmSt.camera.x;
    y = unit->yPos * 16 - gBmSt.camera.y;

    if ((x < 0) || (x > DISPLAY_WIDTH) || (y < 0) || (y > DISPLAY_HEIGHT)) {
        proc->unk_4C++;
        Proc_Goto(proc, 0);
    } else {
        MU_StartDeathFade(StartMu(unit));
        proc->unk_4C++;
        Proc_Break(proc);
    }

    return;
}

void StatusHealEffect_OverlayBg_Init() {
    int i;
    u16* src;
    u16* dst;

    ClearBg0Bg1();

    Decompress(gUnkData_40, (u8*)BG_VRAM + 0x5000);
    ApplyPalette(gUnkData_41, 3);

    CallARM_FillTileRect(gBG0TilemapBuffer, gUnkData_42, 0x3280);

    src = gBG0TilemapBuffer;
    dst = gBG0TilemapBuffer + 0x80;
    for (i = 0; i < 7; dst += 0x80, i++) {
        TileMap_CopyRect(src, dst, 2, 4);
    }

    BG_EnableSyncByMask(1);

    return;
}

void StatusHealEffect_OverlayBg_Loop() {
    BG_SetPosition(0, gBmSt.camera.x - (gActiveUnit->xPos * 16), GetGameClock());

    return;
}

void StatusHealEffect_BlendedSprite_Init(struct UnknownBMUSAilmentProc* proc) {

    HideUnitSprite(gActiveUnit);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 1;

    gLCDControlBuffer.wincnt.wout_enableBlend = 0;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.wobj_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wobj_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wobj_enableObj = 1;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 1);

    proc->unk_4C = 64;

    return;
}

void StatusHealEffect_BlendedSprite_Loop(struct UnknownBMUSAilmentProc* proc) {

    PutBlendWindowUnitSprite(
        4,
        gActiveUnit->xPos * 16 - gBmSt.camera.x,
        gActiveUnit->yPos * 16 - gBmSt.camera.y,
        0x2800,
        gActiveUnit
    );

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void StatusHealEffect_BlendedSprite_Finish() {
    ShowUnitSprite(gActiveUnit);
    return;
}
