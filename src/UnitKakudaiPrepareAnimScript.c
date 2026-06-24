#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmbattle.h"

void UnitKakudaiPrepareAnimScript(struct ProcUnitKakudai * proc)
{
    void * ptr;
    struct Anim * anim;
    int status, front_mode;

#ifndef NONMATCHING
    const u8 * cfg;
    register int mode asm("r2");
    register int r0 asm("r0");
    u8 mode2;

    mode2 = BanimDefaultStandingTypes[gEkrDistanceType];
    asm("":::"r0", "r1");
    cfg = BanimDefaultModeConfig;
    r0 = mode2 * 4;
    front_mode = cfg[r0 + 0];
#else
    int mode;
    u8 mode2;

    mode2 = BanimDefaultStandingTypes[gEkrDistanceType];
    front_mode = BanimDefaultModeConfig[mode2 * 4 + 0];
#endif

    UpdateBanimFrame();

    if(gEkrBattleEndFlag != 0)
    {
        anim = gAnims[2];
        if (anim)
            EndEfxStatusUnits(anim);

        anim = gAnims[0];
        if (anim)
            EndEfxStatusUnits(anim);
    }

    if (gpEkrBattleUnitRight->unit.statusIndex == UNIT_STATUS_PETRIFY || gpEkrBattleUnitRight->unit.statusIndex == UNIT_STATUS_13)
        EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x19, 1);

    if (gpEkrBattleUnitLeft->unit.statusIndex == UNIT_STATUS_PETRIFY || gpEkrBattleUnitLeft->unit.statusIndex == UNIT_STATUS_13)
        EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x17, 1);

    if (proc->type == 0)
        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x17, 1);

    if (gBanimValid[POS_L] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesLeft[front_mode];
        unk = (void *)(gBanimScrLeft + mode);
        src = unk->img;
        proc->pOaml = (void *)gBanimOaml + unk->unk2;
        LZ77UnCompWram(src, gBanimLeftImgSheetBuf);
    }

    if (gBanimValid[POS_R] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesRight[front_mode];
        unk = (void *)(gBanimScrRight + mode);
        src = unk->img;
        proc->pOamr = (void *)gBanimOamr2 + unk->unk2;
        LZ77UnCompWram(src, gBanimRightImgSheetBuf);
    }

    if (gBanimForceUnitChgDebug[POS_L] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[POS_L], gEkrKakudaiSomeBufLeft);

    if (gBanimForceUnitChgDebug[POS_R] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[POS_R], gEkrKakudaiSomeBufRight);

    ptr = OBJ_VRAM1;
    RegisterDataMove(gBanimLeftImgSheetBuf, ptr, 0x4000);

    proc->timer = 0;
    proc->terminator = 0xB;

    proc->x1 = gEkrBmLocation[0] * 0x10 + 8;
    proc->y1 = gEkrBmLocation[1] * 0x10 + 8;
    proc->x2 = gEkrBmLocation[2] * 0x10 + 8;
    proc->y2 = gEkrBmLocation[3] * 0x10 + 8;
    proc->left_pos = BanimTypesPosLeft[gEkrDistanceType];
    proc->right_pos = BanimTypesPosRight[gEkrDistanceType];

    if (gEkrInitPosReal == POS_L)
        proc->right_pos += BanimLeftDefaultPos[gEkrDistanceType];
    else
        proc->left_pos -= BanimLeftDefaultPos[gEkrDistanceType];

    Proc_Break(proc);
}
