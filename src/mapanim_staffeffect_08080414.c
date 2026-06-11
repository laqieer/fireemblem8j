#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"



/* prototypes for same-file helpers called by this run */
void SetDefaultMapAnimScreenConf(void);

void MapAnimSleepEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimSleep, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimSleep_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_85, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();

    Decompress(Img_SleepSprites, OBJ_VRAM0 + OBCHR_MANIM_1C0 * CHR_SIZE);
    ApplyPalette(Pal_SleepSprites, 0x10 + OBJPAL_MANIM_4);

    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay - 16,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

void MapAnimSleep_Anim1(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_85, proc->xDisplay);
    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay - 8,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

void MapAnimSleep_Anim2(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_85, proc->xDisplay);
    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

void MapAnimMonsterStoneEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimMonsterStone, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}
