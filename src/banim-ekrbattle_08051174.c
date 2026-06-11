#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrlevelup.h"
#include "ekrclasschg.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"
#include "eventinfo.h"
#include "constants/songs.h"

/* ekr */
extern EWRAM_OVERLAY(banim) struct Anim * gAnims[4];
extern EWRAM_OVERLAY(banim) void * gEkrbattle_0[2];
extern EWRAM_OVERLAY(banim) int gEkrDebugTimer;
extern EWRAM_OVERLAY(banim) int gEkrDebugUnk1;
extern EWRAM_OVERLAY(banim) int gEkrDebugUnk2;
extern EWRAM_OVERLAY(banim) int gCtrlC01Blocking;
extern EWRAM_OVERLAY(banim) s16 gEkrXPosReal[2];
extern EWRAM_OVERLAY(banim) s16 gEkrYPosReal[2];
extern EWRAM_OVERLAY(banim) struct Vec2 gEkrBg0QuakeVec;
extern EWRAM_OVERLAY(banim) void * gEkrbattle_1[2];
extern EWRAM_OVERLAY(banim) void * gEkrbattle_2[2];
extern EWRAM_OVERLAY(banim) void * gBanimTerrainPaletteMaybe[2];
extern EWRAM_OVERLAY(banim) u16 * gpEfxUnitPaletteBackup[2];
extern EWRAM_OVERLAY(banim) struct ProcEkrBattle * gpProcEkrBattle;
extern EWRAM_OVERLAY(banim) struct ProcEkrGauge * gpProcEkrGauge;
extern EWRAM_OVERLAY(banim) struct ProcEkrDispUP * gpProcEkrDispUP;
extern EWRAM_OVERLAY(banim) u8 gUnk_Banim_Ekrbattle_0[0x2000];
extern EWRAM_OVERLAY(banim) u16 gEfxPal[0x130];
extern EWRAM_OVERLAY(banim) struct Font gBanimFont;
extern EWRAM_OVERLAY(banim) struct Text gBanimText[20];
extern EWRAM_OVERLAY(banim) u32 gEkrBattleEndFlag;

/* efx */
extern EWRAM_OVERLAY(banim) u32 gEkrHpBarCount;
extern EWRAM_OVERLAY(banim) u32 gEfxSpellAnimExists;
extern EWRAM_OVERLAY(banim) u32 gEkrbattle_3;
extern EWRAM_OVERLAY(banim) u32 gEkrDeadEventExist;
extern EWRAM_OVERLAY(banim) u32 gEfxQuakeExist;
extern EWRAM_OVERLAY(banim) u32 gEfxHitQuakeExist;
extern EWRAM_OVERLAY(banim) u32 gEkrInitPosReal;
extern EWRAM_OVERLAY(banim) u32 gEfxFarAttackExist;
extern EWRAM_OVERLAY(banim) u32 gEfxBgSemaphore;
extern EWRAM_OVERLAY(banim) u32 gEfxHpBarResireFlag;
extern EWRAM_OVERLAY(banim) u32 gEkrbattle_4;
extern EWRAM_OVERLAY(banim) u32 gEfxTeonoState;
extern EWRAM_OVERLAY(banim) u32 gEkrbattle_5;
extern EWRAM_OVERLAY(banim) struct Vec2 gEkrBg2QuakeVec;
extern EWRAM_OVERLAY(banim) s16 gEkrbattle_6[2];
extern EWRAM_OVERLAY(banim) s16 gEfxSpecalEffectExist[2];
extern EWRAM_OVERLAY(banim) struct ProcEfxStatusUnit *gpProcEfxStatusUnits[2];
extern EWRAM_OVERLAY(banim) struct ProcEfxWeaponIcon *gpProcEfxWeaponIcon;
extern EWRAM_OVERLAY(banim) struct ProcEfxSpellCast * gpProcEfxSpellCast;
extern EWRAM_OVERLAY(banim) struct ProcEfxHpBarColorChange * gpProcEfxHpBarColorChange;
extern EWRAM_OVERLAY(banim) s16 gEkrHitNow[2];
extern EWRAM_OVERLAY(banim) u16 gEkrBarfxBuf[0x180];
extern EWRAM_OVERLAY(banim) u16 gEkrTsaBuffer[0x1000 / sizeof(u16)];
extern EWRAM_OVERLAY(banim) u16 gPal_Banim[0xA0];
extern EWRAM_OVERLAY(banim) u16 gTmB_Banim[0x2520 / sizeof(u16)];
extern EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufA[0x30];
extern EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufB[0x30];
extern EWRAM_OVERLAY(banim) s16 gEfxSplitedColorBufC[0x30 / 2];
extern EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufD[0x30];
extern EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufE[0x30];
extern EWRAM_OVERLAY(banim) s16 gEfxSplitedColorBufF[0x30 / 2];
extern EWRAM_OVERLAY(banim) int gEkrbattle_7;

/* ekrmain */
extern EWRAM_OVERLAY(banim) int gEkrWindowAppearExist;
extern EWRAM_OVERLAY(banim) int gEkrNamewinAppearExist;
extern EWRAM_OVERLAY(banim) int gProcEkrBaseAppearExist;
extern EWRAM_OVERLAY(banim) u32 gEkrbattle_8;
extern EWRAM_OVERLAY(banim) struct BanimUnkStructComm gEkrbattle_9;
extern EWRAM_OVERLAY(banim) u32 gBanimDoneFlag[2];
extern EWRAM_OVERLAY(banim) u32 gEkrBgPosition;
extern EWRAM_OVERLAY(banim) int gUnk_Banim_Ekrbattle_10;

/* EWRAM data */
extern EWRAM_DATA int gBanimLinkArenaFlag;
extern EWRAM_DATA int gBattleDeamonActive;
extern EWRAM_DATA struct ProcEkrBattleDeamon * gpProcEkrBattleDeamon;

void ekrBattle_StartPromotion(struct ProcEkrBattle *proc)
{
    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        NewEkrClassChg(gAnims[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattle_WaitPromotionIdle;
    } else {
        proc->speedup = false;
        proc->proc_idleCb = (ProcFunc)ekrBattleInRoundIdle;
    }
}

void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle *proc)
{
    if (EkrClasschgFinished() == true) {
        EndEkrClasschg();
        gBanimExpGain[0] = 1;
        proc->proc_idleCb = (ProcFunc)ekrBattle_ExecEkrLvup;
    }
}
