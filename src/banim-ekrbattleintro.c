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
#include "chapterdata.h"
#include "spellassoc.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
































































void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrWindowAppearExist = false;
        EkrGauge_SetInitFlag();
        Proc_Break(proc);
        return;
    }
    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax, proc->timer, proc->terminator);

    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, (u16)gEkrBg0QuakeVec.y + iy);
}

void NewEkrNamewinAppear(int identifier, int duration, int delay)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrNamewinAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = delay;
    proc->ymax_name = -49;

    if (identifier == 0)
        EkrDispUP_SetPositionUnsync(0, proc->ymax_name);
    else
        EkrDispUP_SetPositionUnsync(0, 0);

    gEkrNamewinAppearExist = true;
    UnsyncEkrDispUP();
}
