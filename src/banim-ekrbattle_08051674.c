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

void ekrBattle_5(struct ProcEkrBattle *proc)
{
    if (++proc->timer > 10) {
        if (gBanimExpGain[0] != 0) {
            proc->timer = gBanimExpPrevious[0];
            proc->end = gBanimExpPrevious[0] + gBanimExpGain[0];
        } else if (gBanimExpGain[1] != 0) {
            proc->timer = gBanimExpPrevious[1];
            proc->end = gBanimExpPrevious[1] + gBanimExpGain[1];
        }

        proc->proc_idleCb = (ProcFunc)ekrBattleWaitExpBarIdle;
        EfxPlaySE(SONG_74, 0x100);
        M4aPlayWithPostionCtrl(SONG_74, 0x78, 0);
    }
}

void ekrBattleWaitExpBarIdle(struct ProcEkrBattle *proc)
{
    int i, val1, val2, val3;

    u16 *buf0;
    u16 *buf;
    buf = gEkrBarfxBuf;
    buf0 = gEkrBarfxBuf + 0x80;

    val1 = DivRem(proc->timer, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(buf, val1);

    for (i = 0; i < 13; i++)
    {
        CpuFastSet(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 8);
    }

    CpuFastSet(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 8);
    CpuFastSet(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 8);
    RegisterDataMove(buf0, (void *)0x60021A0, 0x1E0);

    if (++proc->timer > proc->end) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattlePostExpBarIdle;
    }
}

void ekrBattlePostExpBarIdle(struct ProcEkrBattle *proc)
{
    if (proc->timer == 0)
        DoM4aSongNumStop(SONG_74);

    if (++proc->timer > 30) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_6;
    }
}
