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

/* prototypes for same-file helpers called by this run */
int GetBanimLinkArenaFlag(void);

void Nop_BanimEkrbattle_1(void)
{
    return;
}

void ekrBattle_Init(struct ProcEkrBattle *proc)
{
    gEkrBgPosition = 0;
    if (gEkrInitPosReal == 0) {
        if (gEkrDistanceType == EKR_DISTANCE_FAR)
            gEkrBgPosition = -0x20;
        else
            gEkrBgPosition = -0xF0;
    }

    InitMainAnims();
    RegisterEkrDragonStatusType();
    InitEkrDragonStatus();

    gCtrlC01Blocking = 1;

    if (true == GetBattleAnimArenaFlag())
        proc->timer = 0;
    else
        proc->timer = 0x1E;

    if (EKR_POS_L == gEkrInitialHitSide)
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
    else
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

    proc->unk58 = 0;
    Proc_Break(proc);
}

void ekrBattleMain(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 0x1F) {
        if (GetBanimLinkArenaFlag() != 1 && (proc->is_quote == true || proc->unk58 == true)) {
            NewEkrWindowAppear(1, 7);
            NewEkrNamewinAppear(1, 7, 0);
            proc->proc_idleCb = (ProcFunc)ekrBattle_HandlePreEventMaybe;
            proc->timer = 0;
        } else {
            proc->proc_idleCb = (ProcFunc)ekrBattlePrepareDragonIntro;
            proc->timer = 0;
        }
    }
}

void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle *proc)
{
    if (CheckEkrWindowAppearUnexist() != true)
        return;

    EnableEkrGauge();
    AsyncEkrDispUP();
    CpuFastFill(0, gBG0TilemapBuffer, 0x800);
    BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
    BG_SetPosition(BG_1, 0, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    EkrGauge_Set4C50();

    if (proc->is_quote == true) {
        if (gEkrInitialHitSide == EKR_POS_L)
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
        else
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

        proc->is_quote = false;
    }

    proc->proc_idleCb = (ProcFunc)ekrBattleWaitPreEvent;
}

void ekrBattleWaitPreEvent(struct ProcEkrBattle *proc)
{
    if (BattleEventEngineExists() != false)
        return;

    EfxPrepareScreenFx();
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    NewEkrWindowAppear(0, 7);
    NewEkrNamewinAppear(0, 7, 0);
    DisableEkrGauge();
    UnAsyncEkrDispUP();
    EkrGauge_Clr4C50();
    proc->proc_idleCb = (ProcFunc)ekrBattle_0;
}

void ekrBattle_0(struct ProcEkrBattle *proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        proc->proc_idleCb = (ProcFunc)ekrBattlePrepareDragonIntro;
        proc->timer = 0;
    }
}
