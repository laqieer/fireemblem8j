#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);



void EfxInitTerrainBg(void)
{
    struct BanimUnkStructComm * unk0201FADC = &gEkrbattle_9;
    struct BattleAnimTerrain * terrain1 = &battle_terrain_table[gBanimFloorfx[0]];
    struct BattleAnimTerrain * terrain2 = &battle_terrain_table[gBanimFloorfx[1]];

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        gEkrbattle_1[0] = &gUnk_Banim_Ekrbattle_0[0];
        gEkrbattle_1[1] = &gUnk_Banim_Ekrbattle_0[0x1000];
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        gEkrbattle_1[0] = &gUnk_Banim_Ekrbattle_0[0x800];
        gEkrbattle_1[1] = &gUnk_Banim_Ekrbattle_0[0x1800];
        break;

    }

    switch (gPlaySt.chapterWeatherId) {
        // dummy, both cases do the same thing
    case WEATHER_SNOW:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;

    default:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;
    }

    gEkrbattle_2[0] = TsaConfs_BanimTmA[gEkrDistanceType * 2];
    gEkrbattle_2[1] = TsaConfs_BanimTmA[gEkrDistanceType * 2 + 1];

    unk0201FADC->terrain_l = gBanimFloorfx[0];
    unk0201FADC->pal_l = 4;
    unk0201FADC->chr_l = 640;
    unk0201FADC->terrain_r = gBanimFloorfx[1];
    unk0201FADC->pal_r = 5;
    unk0201FADC->chr_r = 640;
    unk0201FADC->distance = gEkrDistanceType;
    unk0201FADC->unk0E = 2;
    unk0201FADC->unk1C = 0;
    unk0201FADC->unk20 = &gUnk_Banim_Ekrbattle_0[0];
    unk0201FADC->unk10 = (u16)gEkrSnowWeather;
    InitBanimTerrain(unk0201FADC);
}

void EfxPrepareScreenFx(void)
{
    const char *str;

    ApplyPalette(Pal_Text, 2);
    ApplyPalette(Pal_Text, 3);
    InitTextFont(&gBanimFont, (void *)0x6001880, 0xC4, 2);
    SetTextDrawNoClear();
    LZ77UnCompVram(Img_Banimmisc_0, (void *)0x6001000);

    /* left unit name */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitLeft->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[0], 7);
    Text_SetCursor(&gBanimText[0], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxLeftNameBox, (void *)0x6001880);
    Text_DrawString(&gBanimText[0], str);

    /* left unit item */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitLeft->weaponBefore);

    InitText(&gBanimText[2], 8);
    Text_SetCursor(&gBanimText[2], GetStringTextCenteredPos(0x40, str));
    LZ77UnCompVram(Img_EfxLeftItemBox, (void *)0x6001A40);
    Text_DrawString(&gBanimText[2], str);

    /* right unit name */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitRight->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[3], 7);
    Text_SetCursor(&gBanimText[3], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxRightNameBox, (void *)0x6001C40);
    Text_DrawString(&gBanimText[3], str);

    /* right unit item */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitRight->weaponBefore);

    InitText(&gBanimText[1], 8);
    Text_SetCursor(&gBanimText[1], GetStringTextCenteredPos(0x3E, str));
    LZ77UnCompVram(Img_EfxRightItemBox, (void *)0x6001E00);
    Text_DrawString(&gBanimText[1], str);

    BG_Fill(gBG0TilemapBuffer, 0x80);
    EfxTmCpyBG(gBanimmisc_5, gBG0TilemapBuffer + 0x1E, 2, 20, -1, -1);
    EfxTmReplacePal(gBG0TilemapBuffer + 0x1F, 1, 20, 2, 128);
    EfxTmReplacePal(gBG0TilemapBuffer + 0x1E, 1, 20, 3, 128);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    CpuFastCopy(&PAL_BUF_COLOR(gBanimmisc_6, gBanimFactionPal[POS_L], 0), PAL_BG(0x2), 0x20);
    CpuFastCopy(&PAL_BUF_COLOR(gBanimmisc_6, gBanimFactionPal[POS_R], 0), PAL_BG(0x3), 0x20);
    EnablePaletteSync();

    gEkrBg0QuakeVec.x = 0;
    gEkrBg0QuakeVec.y = 0;
    BG_SetPosition(BG_0, 0, 0);
}

int GetBanimInitPosReal(void)
{
    int quote1, quote2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_FAR:
        return gEkrInitialHitSide;

    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        return EKR_POS_R;

    case EKR_DISTANCE_FARFAR:
    default:
        quote2 = false;
        quote1 = false;

        if (gEkrDebugModeMaybe == 0) {
            quote1 = ShouldCallBattleQuote(gEkrPids[EKR_POS_L],  gEkrPids[EKR_POS_R]);
            quote2 = ShouldCallBattleQuote(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);
        }

        if (quote1 == true)
            return EKR_POS_L;
        else if (quote2 == true)
            return EKR_POS_R;
        else
            return gEkrInitialHitSide;
    }
}

void SetEkrBg2QuakeVec(int a, int b)
{
    gEkrBg2QuakeVec.x = a;
    gEkrBg2QuakeVec.y = b;
}

void EkrEfxStatusClear(void)
{
    gEkrHpBarCount = 0;
    gEfxSpellAnimExists = 0;
    gEkrbattle_3 = 0;
    gEkrDeadEventExist = 0;
    gEfxQuakeExist = 0;
    gEfxHitQuakeExist = 0;
    gEfxFarAttackExist = 0;
    gEfxBgSemaphore = 0;
    gEfxHpBarResireFlag = 0;
    gEkrbattle_4 = 0;
    gEfxTeonoState = 0;
    gEkrbattle_5 = 0;
    SetEkrBg2QuakeVec(0, 0);
    gEkrbattle_6[0] = 0;
    gEkrbattle_6[1] = 0;
    gEfxSpecalEffectExist[0] = 0;
    gEfxSpecalEffectExist[1] = 0;
    gEkrHitNow[0] = 0;
    gEkrHitNow[1] = 0;

    gpProcEfxStatusUnits[EKR_POS_L] = NULL;
    gpProcEfxStatusUnits[EKR_POS_R] = NULL;

    gpProcEfxSpellCast = NULL;
    gpProcEfxHpBarColorChange = NULL;
}
