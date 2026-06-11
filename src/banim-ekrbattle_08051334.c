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

void ekrBattle_3(struct ProcEkrBattle *proc)
{
    int pos, ret;

    if (gEkrHpBarCount != 0)
        return;

    if (gEkrDeadEventExist != 0)
        return;

    ret = CheckEkrNamewinAppearUnexist();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (CheckEkrDragonDead(gAnims[0]) != false)
        return;

    if (gBanimExpGain[EKR_POS_L] != 0)
        pos = EKR_POS_L;
    else
        pos = EKR_POS_R;

    if (pos != gEkrInitPosReal)
        proc->speedup = ret;

    if (proc->speedup == true)
        NewEfxFarAttackWithDistance(gAnims[gEkrInitPosReal * 2], -1);
}

/**
 * Battle anim has done and prepare to draw up exp bar
 */
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (GetBanimLinkArenaFlag() != 1 && gBanimExpGain[EKR_POS_L] != -gBanimExpGain[EKR_POS_R])
        proc->proc_idleCb = (ProcFunc)ekrBattleExecExpGain;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattleExecExpGain(struct ProcEkrBattle * proc)
{
    int i;
    u32 ret, val0, val1, val2, val3;

    u16 * buf = gEkrBarfxBuf;
    u16 * buf0 = gEkrBarfxBuf + 0x80;

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0x94, 0xF0, 0x94);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    RegisterDataMove(Img_EkrExpBar, (void *)0x6002000, 0x300);
    EfxTmCpyBG(Tsa_EkrExpBar, TILEMAP_LOCATED(gBG1TilemapBuffer, 6, 17), 18, 3, 1, 0x100);
    CpuFastCopy(Pal_ExpBar, PAL_BG(1), 0x20);
    BG_EnableSyncByMask(2);
    EnablePaletteSync();
    ret = GetBanimDragonStatusType();

    switch (ret) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg0cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        break;

    default:
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg0cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    EkrGauge_Setup44(1);

    if (gBanimExpGain[EKR_POS_L] != 0)
        val0 = gBanimExpPrevious[EKR_POS_L];
    else
        val0 = gBanimExpPrevious[EKR_POS_R];

    val1 = DivRem(val0, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(gEkrBarfxBuf, val1);

    for (i = 0; i < 13; i++)
    {
        CpuFastCopy(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 0x20);
    }

    CpuFastCopy(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 0x20);
    CpuFastCopy(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 0x20);
    RegisterDataMove(buf0, (void *)0x60021A0, 0x1E0);

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_4;
}
