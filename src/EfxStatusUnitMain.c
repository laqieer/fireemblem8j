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

void EfxStatusUnitMain(struct ProcEfxStatusUnit *proc)
{
    int ret, _ret;

    if (GetUnitEfxDebuff(proc->anim) == UNIT_STATUS_NONE || proc->invalid == true)
        return;

    if (proc->debuff != proc->debuf_bak) {
        proc->timer = 0;
        proc->frame = 0;
        proc->debuf_bak = proc->debuff;
    }

    /* seems like a interpolate-style function ? */
    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, proc->frame_lut);
    if (ret >= 0) {
        switch (proc->debuff) {
        case UNIT_STATUS_POISON:
            proc->red = ret;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_SLEEP:
            proc->red = 0;
            proc->green = 0;
            proc->blue = ret;
            break;

        case UNIT_STATUS_BERSERK:
            proc->red = ret;
            proc->green = 0;
            proc->blue = 0;
            break;

        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            proc->red = 0x10;
            proc->green = 0x10;
            proc->blue = 0x10;
            break;

        case UNIT_STATUS_12:
            proc->red = ret;
            proc->green = ret;

            _ret = ret + 1;
            if (_ret < 0)
                _ret = ret + 4;

            proc->blue = _ret >> 2;
            break;

        default:
            proc->red = ret;
            proc->green = ret;
            proc->blue = ret;
            break;
        }
    }

    switch (proc->debuff) {
    case UNIT_STATUS_POISON:
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_BERSERK:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_12:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            EfxDecodeSplitedPalette(
                PAL_OBJ(OBPAL_EFX_UNIT_L),
                gFadeComponents,
                &gFadeComponents[0x30],
                (s16 *)&gFadeComponents[0x180],
                16, proc->red, 16);
        else
            EfxDecodeSplitedPalette(
                PAL_OBJ(OBPAL_EFX_UNIT_R),
                &gFadeComponents[0x60],
                &gFadeComponents[0x90],
                (s16 *)&gFadeComponents[0x300],
                16, proc->red, 16);

        RefreshEntityBmMaps();
        RefreshUnitSprites();
        EndAllMus();
        break;

    case UNIT_STATUS_SILENCED:
        EfxStatusUnitFlashing(proc->anim, proc->red, proc->green, proc->blue);
        break;

    default:
        break;
    }

    EnablePaletteSync();
}
