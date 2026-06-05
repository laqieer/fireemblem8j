#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"

#include "constants/video-banim.h"

/**
 * Debuff unit status flash effect for banim (Unit::statusIndex)
 */





void DisableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = true;
}

void EnableEfxStatusUnits(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->invalid = false;
}

void SetUnitEfxDebuff(struct Anim *anim, int debuff)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    procs[GetAnimPosition(anim)]->debuff = debuff;

    if (debuff == UNIT_STATUS_NONE)
        EfxStatusUnitFlashing(anim, 0, 0, 0);
}

u32 GetUnitEfxDebuff(struct Anim *anim)
{
    struct ProcEfxStatusUnit **procs = gpProcEfxStatusUnits;
    return procs[GetAnimPosition(anim)]->debuff;
}

void EfxStatusUnitFlashing(struct Anim *anim, int r, int g, int b)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x17, 1, r, g, b);

        if (GetEkrDragonStatusUnk1() != 0)
        {
            BanimSetFrontPaletteForDragon(anim);
            EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x6, 1, r, g, b);
        }
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);
        EfxPalFlashingInOut(&PAL_COLOR(0, 0), 0x19, 1, r, g, b);
    }
}
