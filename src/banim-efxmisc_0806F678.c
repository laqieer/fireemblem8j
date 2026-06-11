#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

/**
 * Misc banim effects
 */



/* prototypes for same-file helpers called by this run */
void NewEfxLokmsunaOBJ(struct Anim *anim);

void NewEfxSunakemuriOBJ(struct Anim *anim, int type)
{
    int terrain;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSunakemuriOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxSunakemuriOBJ1_R;
    if (type != 0) {
        scr1 = AnimScr_EfxSunakemuriOBJ3_R;
        if (type == 1)
            scr1 = AnimScr_EfxSunakemuriOBJ2_R;
    }

    scr2 = AnimScr_EfxSunakemuriOBJ1_L;
    if (type != 0) {
        scr2 = AnimScr_EfxSunakemuriOBJ3_L;
        if (type == 1)
            scr2 = AnimScr_EfxSunakemuriOBJ2_L;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);

    terrain = gBanimTerrain[GetAnimPosition(proc->anim)];
    switch (terrain) {
    case TERRAIN_PLAINS:
    case TERRAIN_ROAD:
    case TERRAIN_VILLAGE_REGULAR:
    case TERRAIN_VILLAGE_CLOSED:
    case TERRAIN_HOUSE:
    case TERRAIN_FORT:
    case TERRAIN_FOREST:
    case TERRAIN_THICKET:
    case TERRAIN_SAND:
    case TERRAIN_DESERT:
    case TERRAIN_MOUNTAIN:
    case TERRAIN_PEAK:
    case TERRAIN_BRIDGE_REGULAR:
    case TERRAIN_FENCE_REGULAR:
    case TERRAIN_WALL_REGULAR:
    case TERRAIN_WALL_DAMAGED:
    case TERRAIN_RUBBLE:
    case TERRAIN_ROOF:
    case TERRAIN_GATE_REGULAR:
    case TERRAIN_RUINS_REGULAR:
    case TERRAIN_CLIFF:
    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
    case TERRAIN_SHIP_FLAT:
    case TERRAIN_SHIP_WRECK:
    case TERRAIN_GLACIER:
    case TERRAIN_SNAG:
    case TERRAIN_INN:
    case TERRAIN_BARREL:
    case TERRAIN_BONE:
    case TERRAIN_DARK:
    case TERRAIN_GUNNELS:
    case TERRAIN_BRACE:
    case TERRAIN_MAST:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        break;
    
    case TERRAIN_BRIDGE_14:
        if (IsAnimSoundInPositionMaybe(proc->anim) != EKR_POS_L)
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        else
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case TERRAIN_ARMORY:
    case TERRAIN_VENDOR:
    case TERRAIN_ARENA_REGULAR:
    case TERRAIN_C_ROOM_09:
    case TERRAIN_GATE_CASTLE:
    case TERRAIN_FLOOR_REGULAR:
    case TERRAIN_FLOOR_MAGIC:
    case TERRAIN_PILLAR:
    case TERRAIN_DOOR:
    case TERRAIN_THRONE:
    case TERRAIN_CHEST_EMPTY:
    case TERRAIN_CHEST_FULL:
    case TERRAIN_CHURCH:
    case TERRAIN_STAIRS:
    case TERRAIN_ARENA_30:
    case TERRAIN_VALLEY:
    case TERRAIN_FENCE_32:
    case TERRAIN_RUINS_VILLAGE:
    case TERRAIN_DECK:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ3, 0x20);
        break;

    case TERRAIN_NONE:
    default:
        break;
    }

    SpellFx_RegisterObjGfx(Img_EfxSunakemuriOBJ, 0x1000);
}

void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x9) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C4E: banim_code_effect_dirt_wave
 */
void NewEfxLokmsuna(struct Anim *anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}
