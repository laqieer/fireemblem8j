#include "global.h"
#include "functions.h"
#include "variables.h"
#include "fontgrp.h"
#include "hardware.h"
#include "sio.h"
#include "prepscreen.h"

//! FE8U = 0x08097804
void InitPrepScreenMainMenu(struct ProcAtMenu* proc)
{
    int color;

    StartPrepScreenMenu(proc);
    if (!CheckInLinkArena()) {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_SYSTEM_WHITE,
            0x509, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_SYSTEM_WHITE,
            0x50B, 0);

        AtMenu_AddPrepScreenSupportMenuItem(proc);

        if (CanPrepScreenCheckMap()) {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_SYSTEM_WHITE,
                0x50C, 0);
        } else {
            SetPrepScreenMenuItem(
                PREP_MAINMENU_CHECKMAP,
                PrepScreenMenu_OnCheckMap,
                TEXT_COLOR_SYSTEM_GRAY,
                0x50C, 0);
        }

        color = TEXT_COLOR_SYSTEM_WHITE;
        if (!CanPrepScreenSave())
            color = TEXT_COLOR_SYSTEM_GRAY;

        SetPrepScreenMenuItem(
            PREP_MAINMENU_SAVE,
            PrepScreenMenu_OnSave,
            color,
            0x50D, 0);

    } else {
        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNIT,
            PrepScreenMenu_OnPickUnits,
            TEXT_COLOR_SYSTEM_WHITE,
            0x509, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_ITEM,
            PrepScreenMenu_OnItems,
            TEXT_COLOR_SYSTEM_WHITE,
            0x50B, 0);

        SetPrepScreenMenuItem(
            PREP_MAINMENU_UNK3,
            PrepScreenMenu_OnUnk3,
            TEXT_COLOR_SYSTEM_WHITE,
            0x45, 0);
    }

    SetPrepScreenMenuOnBPress(PrepScreenMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepScreenMenu_OnStartPress);

    TileMap_FillRect(gBG0TilemapBuffer, 0xC, 0x13, 0);
    TileMap_FillRect(gBG1TilemapBuffer, 0xC, 0x13, 0);

    if (CheckInLinkArena())
        SetPrepScreenMenuPosition(1, 5);
    else
        SetPrepScreenMenuPosition(1, 6);

    SetPrepScreenMenuSelectedItem(proc->cur_cmd);
}
