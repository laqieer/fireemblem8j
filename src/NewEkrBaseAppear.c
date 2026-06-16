#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "hardware.h"

void NewEkrBaseAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrBaseAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;

    if (identifier == 0)
        BG_SetPosition(BG_2, 0, -0x58);
    else
        BG_SetPosition(BG_2, 0, 0);

    gProcEkrBaseAppearExist = true;
}
