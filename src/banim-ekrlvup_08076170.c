#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/**
 * section.ewramdata
 */

extern EWRAM_OVERLAY(banim) struct ProcEkrLevelup * gpProcEkrLevelup;
extern EWRAM_OVERLAY(banim) struct Unit * gpEkrLvupUnit;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupPreLevel;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos1;
extern EWRAM_OVERLAY(banim) u16 gEkrLvupScrollPos2;

/**
 * section.data
 */

extern const u16 sEfxLvupPartsPos[];

CONST_DATA struct FaceVramEntry gEkrlvup_2[4] = {
    [0] = {
        .tileOffset = 0,
        .paletteId  = 15,
    },

    [1] = {0},
    [2] = {0},
    [3] = {0},
};







/* prototypes for same-file helpers called by this run */
void EkrLvup_InitStatusText(struct ProcEkrLevelup *proc);

void EkrLvup_InitLevelUpBox(struct ProcEkrLevelup *proc)
{
    int portrait;
    struct BattleUnit *bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit *bu2 = gpEkrBattleUnitRight;
    struct Anim *anim = proc->ais_main;

    LZ77UnCompWram(Img_LevelUpBoxFrame, gSpellAnimBgfx);
    LZ77UnCompWram(Tsa_LevelUpBoxFrame, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, TILEMAP_LOCATED(gBG1TilemapBuffer, 0, 0x6), 0x20, 0x14, 1, 0x100);
    RegisterDataMove(gSpellAnimBgfx, (void *)BG_VRAM + 0x2000, 0x8C0);
    CpuFastCopy(Pal_LevelUpBoxFrame, PAL_BG(1), 0x20);

    LZ77UnCompWram(Img_LvupApfx, gBuf_Banim);
    RegisterDataMove(gBuf_Banim, OBJ_VRAM0 + 0x1400, 0xC00);
    CpuFastCopy(Pal_LvupApfx, PAL_OBJ(1), 0x20);

    EnablePaletteSync();

    proc->timer = EKR_LVUP_UI_BASE;

    if (GetAnimPosition(anim) == EKR_POS_L)
        portrait = bu1->unit.pCharacterData->portraitId;
    else
        portrait = bu2->unit.pCharacterData->portraitId;

    SetupFaceGfxData(&gEkrlvup_2[0]);
    StartFace(0, portrait, 0xBC, EKR_LVUP_UI_BASE, 0x1042);
    gFaces[0]->yPos = 0xA0;

    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);
    EkrLvup_InitStatusText(proc);
    Proc_Break(proc);
}
