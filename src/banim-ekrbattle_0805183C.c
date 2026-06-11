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

void ekrBattleLvupHanlder(struct ProcEkrBattle *proc)
{
    int c;

    if (++proc->timer == 0x18) {
        if (gBanimExpGain[EKR_POS_L] != 0)
            c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
        else
            c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
        if (c >= 100)
            NewEkrLvlupFan();
    }

    if (proc->timer <= 0x28)
        return;

    SpellFx_ClearBG1();
    EkrGauge_Setup44(0);

    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        break;

    default:
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    SetWin0Box(0, 0, 0xF0, 0xA0);

    if (gBanimExpGain[EKR_POS_L] != 0)
        c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
    else
        c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
    if (c >= 100)
        proc->proc_idleCb = (ProcFunc)ekrBattle_ExecEkrLvup;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattle_ExecEkrLvup(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (gBanimExpGain[EKR_POS_L] != 0)
        anim = gAnims[EKR_POS_L * 2];
    else
        anim = gAnims[EKR_POS_R * 2];

    NewEkrLevelup(anim);
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrLvupIdle;
}

void ekrBattle_WaitEkrLvupIdle(struct ProcEkrBattle *proc)
{
    if (CheckEkrLvupDone() == true) {
        EndEkrLevelUp();
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
    }
}

void ekrNewEkrPopup(struct ProcEkrBattle *proc)
{
    NewEkrPopup();
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPopup;
}

void ekrBattle_WaitForPopup(struct ProcEkrBattle *proc)
{
    if (CheckEkrPopupEnded() == true) {
        DeleteAnimsOnPopup();
        proc->proc_idleCb = (ProcFunc)ekrBattle_PostPopup;
    }
}

void ekrBattle_PostPopup(struct ProcEkrBattle *proc)
{
    EndProcEfxWeaponIcon();
    EndEfxHPBarColorChange();
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_TriggerDragonStatusFinished;
}

void ekrBattle_TriggerDragonStatusFinished(struct ProcEkrBattle *proc)
{
    int val;

    /* If both side is not the ekrdragon, get here */
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattle_PostDragonStatusEffect;
        return;
    }

    if (proc->side == EKR_POS_L) {
        proc->anim = gAnims[0];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DEMON_KING:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        default:
            break;
        }

        proc->side = EKR_POS_R;
        proc->counter++;

    } else {
        proc->anim = gAnims[2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DEMON_KING:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        default:
            break;
        }

        proc->side = EKR_POS_L;
        proc->counter++;
    }
}

void ekrBattle_WaitEkrDragonEndIdle(struct ProcEkrBattle *proc)
{
    if (CheckEfrDragonStatusAttrEnd(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattle_TriggerDragonStatusFinished;
}

void ekrBattle_PostDragonStatusEffect(struct ProcEkrBattle *proc)
{
    gEkrBattleEndFlag = 1;

    if (gEkrDebugModeMaybe == 0) {
        NewEkrNamewinAppear(2, 7, 0);
        EkrRestoreBGM();
    }

    proc->proc_idleCb = (ProcFunc)Nop_BanimEkrbattle_2;
}
