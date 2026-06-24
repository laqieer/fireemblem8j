#include "global.h"

#include <stdlib.h>

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"

#include "statscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08089418
void DisplayPage0(void)
{
    DisplayTexts(sPage0TextInfo);

    // Displaying str/mag label
    if (UnitHasMagicRank(gStatScreen.unit))
    {
        // mag
        PutDrawText(
            &gStatScreen.text[STATSCREEN_TEXT_POWLABEL],
            gUiTmScratchA + TILEMAP_INDEX(1, 1),
            TEXT_COLOR_SYSTEM_GOLD, 0, 0,
            GetStringFromIndex(0x48E)); // Mag (JP; US 0x4FF)
    }
    else
    {
        // str
        PutDrawText(
            &gStatScreen.text[STATSCREEN_TEXT_POWLABEL],
            gUiTmScratchA + TILEMAP_INDEX(1, 1),
            TEXT_COLOR_SYSTEM_GOLD, 4, 0,
            GetStringFromIndex(0x48D)); // Str (JP; US 0x4FE, JP x=4)
    }

    // displaying str/mag stat value
    DrawStatWithBar(0, 5, 1,
        gStatScreen.unit->pow,
        GetUnitPower(gStatScreen.unit),
        UNIT_POW_MAX(gStatScreen.unit));

    // displaying skl stat value
    DrawStatWithBar(1, 5, 3,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->skl/2
            : gStatScreen.unit->skl,
        GetUnitSkill(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SKL_MAX(gStatScreen.unit)/2
            : UNIT_SKL_MAX(gStatScreen.unit));

    // displaying spd stat value
    DrawStatWithBar(2, 5, 5,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->spd/2
            : gStatScreen.unit->spd,
        GetUnitSpeed(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SPD_MAX(gStatScreen.unit)/2
            : UNIT_SPD_MAX(gStatScreen.unit));

    // displaying lck stat value
    DrawStatWithBar(3, 5, 7,
        gStatScreen.unit->lck,
        GetUnitLuck(gStatScreen.unit),
        UNIT_LCK_MAX(gStatScreen.unit));

    // displaying def stat value
    DrawStatWithBar(4, 5, 9,
        gStatScreen.unit->def,
        GetUnitDefense(gStatScreen.unit),
        UNIT_DEF_MAX(gStatScreen.unit));

    // displaying res stat value
    DrawStatWithBar(5, 5, 11,
        gStatScreen.unit->res,
        GetUnitResistance(gStatScreen.unit),
        UNIT_RES_MAX(gStatScreen.unit));

    // displaying mov stat value
    DrawStatWithBar(6, 13, 1,
        UNIT_MOV_BASE(gStatScreen.unit),
        UNIT_MOV(gStatScreen.unit),
        UNIT_MOV_MAX(gStatScreen.unit));

    // displaying con stat value
    DrawStatWithBar(7, 13, 3,
        UNIT_CON_BASE(gStatScreen.unit),
        UNIT_CON(gStatScreen.unit),
        UNIT_CON_MAX(gStatScreen.unit));

    // displaying unit aid
    PutNumberOrBlank(gUiTmScratchA + TILEMAP_INDEX(13, 5), TEXT_COLOR_SYSTEM_BLUE,
        GetUnitAid(gStatScreen.unit));

    // displaying unit aid icon
    DrawIcon(gUiTmScratchA + TILEMAP_INDEX(14, 5),
        GetUnitAidIconId(UNIT_CATTRIBUTES(gStatScreen.unit)),
        TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

    // displaying unit rescue name
    Text_InsertDrawString(
        &gStatScreen.text[STATSCREEN_TEXT_RESCUENAME],
        24, TEXT_COLOR_SYSTEM_BLUE,
        GetUnitRescueName(gStatScreen.unit));

    // displaying unit status name and turns

    if (gStatScreen.unit->statusIndex != UNIT_STATUS_RECOVER)
    {
        // display name

        Text_InsertDrawString(
            &gStatScreen.text[STATSCREEN_TEXT_STATUS],
            24, TEXT_COLOR_SYSTEM_BLUE,
            GetUnitStatusName(gStatScreen.unit));

        // display turns

        if (gStatScreen.unit->statusIndex != UNIT_STATUS_NONE)
        {
            PutNumberSmall(
                gUiTmScratchA + TILEMAP_INDEX(16, 11),
                0, gStatScreen.unit->statusDuration);
        }
    }
    else
    {
        // I do not understand what this is for

        struct Unit tmp = *gStatScreen.unit;

        tmp.statusIndex = 0;

        Text_InsertDrawString(
            &gStatScreen.text[STATSCREEN_TEXT_STATUS],
            24, TEXT_COLOR_SYSTEM_BLUE,
            GetUnitStatusName(&tmp));
    }

    // display affininity icon

    DrawIcon(
        gUiTmScratchA + TILEMAP_INDEX(12, 9),
        GetUnitAffinityIcon(gStatScreen.unit),
        TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

    // display affinity name (JP-only)

    Text_InsertDrawString(
        &gStatScreen.text[STATSCREEN_TEXT_AFFINLABEL],
        40, TEXT_COLOR_SYSTEM_BLUE,
        GetAffinityName(gStatScreen.unit->pCharacterData->affinity));

    DisplayBwl();
}
