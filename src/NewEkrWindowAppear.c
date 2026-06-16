#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "hardware.h"

void NewEkrWindowAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrWindowAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = 0x39;

    if (identifier == 0)
        iy = 0x39;
    else
        iy = 0x00;

    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, (u16)gEkrBg0QuakeVec.y + iy);
    gEkrWindowAppearExist = true;
    EkrGauge_ClrInitFlag();
}
