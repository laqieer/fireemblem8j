#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"



struct ProcEkrSubAnimeEmulator * NewEkrsubAnimeEmulator(int x, int y, u32 * anim_scr, int type, int oam2Base, int oamBase, ProcPtr parent)
{
    struct ProcEkrSubAnimeEmulator * proc =
        Proc_Start(ProcScr_ekrsubAnimeEmulator, parent);

    proc->timer = 0;
    proc->scr_cur = 0;
    proc->type = type;
    proc->valid = 0;
    proc->x1 = x;
    proc->y1 = y;
    proc->x2 = 0;
    proc->y2 = 0;
    proc->anim_scr = anim_scr;
    proc->sprite = NULL;
    proc->oam2Base = oam2Base;
    proc->oamBase = oamBase;
    return proc;
}

void EkrsubAnimeEmulatorMain(struct ProcEkrSubAnimeEmulator * proc)
{
    struct Anim _anim;
    u32 * anim_scr = proc->anim_scr;
    if (proc->timer == 0)
    {
        u32 inst = anim_scr[proc->scr_cur];
        if (ANIM_INS_TYPE_STOP == ANINS_GET_TYPE(inst))
        {
            switch (proc->type) {
            case 0:
                Proc_Break(proc);
                return;

            case 1:
                proc->timer = 1;
                proc->scr_cur = 0;
                break;

            case 2:
                proc->timer = 1;
                proc->scr_cur--;
                break;

            default:
                break;
            }
        }
        else if (ANIM_INS_TYPE_WAIT == ANINS_GET_TYPE(inst))
        {
            proc->timer = inst;
            proc->scr_cur++;
        }
        else
        {
            proc->sprite = ANINS_FORCESPRITE_GET_ADDRESS(inst);
            proc->timer = ANINS_FORCESPRITE_GET_DELAY(inst);
            proc->scr_cur++;
        }
    }

    proc->timer--;

    if (proc->valid == 0 && proc->sprite != NULL)
    {
        _anim.pSpriteData = proc->sprite;
        _anim.oam2Base = proc->oam2Base;
        _anim.oamBase = proc->oamBase;
        _anim.xPosition = proc->x1 + proc->x2;
        _anim.yPosition = proc->y1 + proc->y2;
        _anim.state2 = 0;
        AnimDisplay(&_anim);
    }
}

int GetAnimSpriteRotScaleX(u32 header)
{
    u32 a = header >> 30;
    u32 b = header & 0xC000;

#if !NONMATCHING
    const s16 * src = gAnimSpriteRotScalePosX;

    a = a << 1;
    b = b >> 11;
    a = a + b;

    return *(s16 *)((void *)src + a);
#else
    return gAnimSpriteRotScalePosX[a + (b >> 12)];
#endif
}

int GetAnimSpriteRotScaleY(u32 header)
{
    u32 a = header >> 30;
    u32 b = header & 0xC000;

#if !NONMATCHING
    const s16 * src = gAnimSpriteRotScalePosY;

    a = a << 1;
    b = b >> 11;
    a = a + b;

    return *(s16 *)((void *)src + a);
#else
    return gAnimSpriteRotScalePosY[a + (b >> 12)];
#endif
}
