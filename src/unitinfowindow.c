#include "global.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmitem.h"

#include "unitinfowindow.h"

#include "constants/classes.h"

enum { LINES_MAX = 5 };

struct UnitInfoWindowProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;

    /* 30 */ struct Text name;
    /* 38 */ struct Text lines[LINES_MAX];

    /* 60 */ u8 x;
    /* 61 */ u8 y;
    /* 62 */ u8 xUnitSprite;
    /* 63 */ u8 xNameText;
};

extern u16 gTSA_UnitInfoWindow[];

void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc* proc);



struct UnitInfoWindowProc* EWRAM_DATA sRescueUnitInfoWindows[2] = {};

/* prototypes for same-file helpers called by this run */
struct UnitInfoWindowProc* NewUnitInfoWindow(ProcPtr parent);
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines);
int GetUnitInfoWindowX(struct Unit* unit, int width);
void DrawUnitConText(struct Text* text, struct Unit* unit);
void DrawUnitAidText(struct Text* text, struct Unit* unit);
void PutUnitAidIconForTextAt(struct Unit* unit, int x, int y);
void DrawUnitResChangeText(struct Text* text, struct Unit* unit, int bonus);
void DrawUnitResUnkText(struct Text* text, struct Unit* unit, int unused);
void DrawAccuracyText(struct Text* text, int accuracy);

//! FE8U = 0x080350A4
void RefreshUnitResChangeInfoWindow(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, y, 10, 1);

    DrawUnitResChangeText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    PutText(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    return;
}

//! FE8U = 0x080350FC
void StartUnitStaffOffenseInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    InitTextDb(proc->lines + 0, 8);
    InitTextDb(proc->lines + 1, 8);

    return;
}

//! FE8U = 0x0803511C
void RefreshUnitStaffOffenseInfoWindow(struct Unit* unit, int hit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitResUnkText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    PutText(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    DrawAccuracyText(proc->lines + 1, hit);
    PutText(proc->lines + 1, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 5));

    return;
}

//! FE8U = 0x0803519C
void StartUnitRescueInfoWindowsCore(ProcPtr parent) {

    sRescueUnitInfoWindows[0] = NewUnitInfoWindow(parent);
    InitTextDb(sRescueUnitInfoWindows[0]->lines + 0, 8);

    sRescueUnitInfoWindows[1] = NewUnitInfoWindow(parent);
    InitTextDb(sRescueUnitInfoWindows[1]->lines + 0, 8);

    return;
}

//! FE8U = 0x080351CC
void RefreshUnitTakeRescueInfoWindows(ProcPtr parent) {
    ResetIconGraphics_();
    LoadIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, gObject_16x16_VFlipped, 6);

    return;
}

//! FE8U = 0x08035204
void RefreshUnitRescueInfoWindows(struct Unit* unit) {

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearBg0Bg1();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

//! FE8U = 0x080352BC
void RefreshUnitTakeInfoWindows(struct Unit* unit) {
    struct Unit* rescue;

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearBg0Bg1();

    rescue = GetUnit(unit->rescue);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], rescue, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, rescue);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

//! FE8U = 0x08035380
void StartUnitGiveInfoWindows(ProcPtr parent) {
    ResetIconGraphics_();
    LoadIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, gObject_16x16, 6);

    return;
}

//! FE8U = 0x080353B8
void RefreshUnitGiveInfoWindows(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct Unit* rescue = GetUnit(gActiveUnit->rescue);

    ClearBg0Bg1();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], rescue, x, y, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[0]->lines + 0, rescue);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    PutUnitAidIconForTextAt(unit, x + 1, y + 6 + 3);

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}
