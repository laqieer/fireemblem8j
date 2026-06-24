#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

extern u16 * gSoloEndingBattleDispConf[];
extern struct Text * CONST_DATA gpCharacterEndingTexts;

void InitCharacterEndingText(void);
void CharacterEnding_LoadUnitBattleStats(struct EndingBattleDisplayProc * proc);
int GetPidTitleTextId(int pid);

//! FE8J = 0x080BB864
void SoloEndingBattleDisp_Init(struct EndingBattleDisplayProc * proc)
{
    const char * str;

    InitCharacterEndingText();

    CharacterEnding_LoadUnitBattleStats(proc);

    BG_Fill(gSoloEndingBattleDispConf[0], 0);
    BG_Fill(gSoloEndingBattleDispConf[1], 0);
    BG_Fill(gSoloEndingBattleDispConf[2], 0);

    CallARM_FillTileRect(gSoloEndingBattleDispConf[2], gTsa_SoloEndingWindow, TILEREF(0x260, 12));
    CallARM_FillTileRect(gSoloEndingBattleDispConf[1], gTsa_SoloEndingNameplate, TILEREF(0x260, 12));

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidA));

    PutDrawText(gpCharacterEndingTexts + 5, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 3), TEXT_COLOR_SYSTEM_WHITE, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(20, 1), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x4CC));
    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(20, 1), TEXT_COLOR_SYSTEM_GOLD, 32, 0, GetStringFromIndex(0x4CD));
    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(20, 1), TEXT_COLOR_SYSTEM_GOLD, 64, 0, GetStringFromIndex(0x4CE));

    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(19, 1), TEXT_COLOR_SYSTEM_BLUE, proc->battleAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(23, 1), TEXT_COLOR_SYSTEM_BLUE, proc->winAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(27, 1), TEXT_COLOR_SYSTEM_BLUE, proc->lossAmounts[0]);

    StartFace2(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 416, 56, FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);

    if (proc->units[0]->state & US_DEAD)
    {
        ArchivePalette(0x16);
        WriteFadedPaletteFromArchive(0xc0, 0xc0, 0xc0, 0x400000);
    }

    proc->timer = 0;
    SetDefaultColorEffects();

    return;
}
