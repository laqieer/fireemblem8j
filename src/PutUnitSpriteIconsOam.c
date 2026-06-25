#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "worldmap.h"

#include "bmudisp.h"
#include "ctc.h"
#include "constants/event-flags.h"

extern const u16 sRescuePalLutTemplate[3];

void PutUnitSpriteIconsOam(void)
{
    u8 protectCharacterId;
    int i;
    int x;
    int y;
    s8 displayRescueIcon;

    int poisonIconFrame;
    int sleepIconFrame;
    int berserkIconFrame;
    int silenceIconFrame;

    u16 rescuePalLut[3];

    memcpy(rescuePalLut, sRescuePalLutTemplate, sizeof(rescuePalLut));

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH) {
        protectCharacterId = GetROMChapterStruct(gPlaySt.chapterIndex)->protectCharacterIndex;
    } else {
        protectCharacterId = 0;
    }

    displayRescueIcon = (GetGameClock() % 32) < 20 ? 1 : 0;

    poisonIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sPoisonIconSprites);
    sleepIconFrame = GetGameClock() / 16 % ARRAY_COUNT(sSleepIconSprites);
    berserkIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sBerserkIconSprites);
    silenceIconFrame = GetGameClock() / 4 % ARRAY_COUNT(sSilenceIconSprites);

    if (CheckFlag(EVFLAG_HIDE_BLINKING_ICON) != 0)
        return;

    PutChapterMarkedTileIconOam();

    for (i = 1; i < 0xc0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        if (GetUnitSpriteHideFlag(unit) != 0)
            continue;

        switch (unit->statusIndex) {
        case UNIT_STATUS_POISON:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), sPoisonIconSprites[poisonIconFrame], 0);
            break;

        case UNIT_STATUS_SILENCED:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), sSilenceIconSprites[silenceIconFrame], 0);
            break;

        case UNIT_STATUS_SLEEP:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 2), OAM0_Y(0x100+y), sSleepIconSprites[sleepIconFrame], 0);
            break;

        case UNIT_STATUS_BERSERK:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 1), OAM0_Y(0x100+y - 5), sBerserkIconSprites[berserkIconFrame], 0);
            break;

        case UNIT_STATUS_ATTACK:
        case UNIT_STATUS_DEFENSE:
        case UNIT_STATUS_CRIT:
        case UNIT_STATUS_AVOID:
            if (!displayRescueIcon)
                continue;

            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 1), OAM0_Y(0x100+y - 5), sSprite_Bmudisp_0, 0);
            break;

        case UNIT_STATUS_SICK:
        case UNIT_STATUS_RECOVER:
            break;
        }

        if (!displayRescueIcon)
            continue;

        if (unit->state & US_RESCUING)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, (rescuePalLut[unit->rescue >> 6] & 0xf) * 0x1000 + 0x803);
        }
        else if ((UNIT_FACTION(unit) != FACTION_BLUE) && (UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, 0x810);
        }
        else if (protectCharacterId == unit->pCharacterData->number)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, 0x811);
        }
    }
}
