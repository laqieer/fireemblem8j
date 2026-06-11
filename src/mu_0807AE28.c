#include "global.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_MuFogBump[];

void StartMuFogBump(int x, int y)
{
    struct APHandle * ap;
    struct MuFogBumpProc * proc;

    Decompress(
        Img_GmapSoguSprites,
        OBJ_VRAM0 + CHR_SIZE * OBCHR_MU_180
    );

    ap = AP_Create(ApHandle_GmapSoguSprites, 2);
    ap->tileBase = OAM2_CHR(OBCHR_MU_180) + OAM2_PAL(OBPAL_MU_1);
    AP_SwitchAnimation(ap, MU_FACING_LEFT);

    proc = Proc_Start(ProcScr_MuFogBump, PROC_TREE_3);
    proc->sprite_anim = ap;
    proc->x = x + 8;
    proc->y = y - 4;
}

void MuFogBump_Init(struct MuFogBumpProc * proc)
{
    PlaySoundEffect(SONG_77);

    proc->timer = 0;
    SetObjAffineAuto(0, 0, 0x200, 0x200);
}

void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc)
{
    int scale;

    if (proc->timer++ >= 8)
        Proc_Break(proc);

    scale = Interpolate(INTERPOLATE_RCUBIC, 0x200, 0x100, proc->timer, 8);
    SetObjAffineAuto(0, 0, scale, scale);

    AP_Update(
        proc->sprite_anim,
        (proc->x - 8),
        (proc->y - 8) | OAM0_AFFINE_ENABLE | OAM0_DOUBLESIZE);
}

void MuFogBump_EndLoop(struct MuFogBumpProc * proc)
{
    if (proc->timer++ >= 40)
        Proc_Break(proc);

    AP_Update(
        proc->sprite_anim,
        (proc->x),
        (proc->y) | OAM0_AFFINE_ENABLE);
}

u8 MU_IsFogBumpFxActive(void)
{
    return Proc_Exists(ProcScr_MuFogBump);
}
