#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void StartMapAnimInfoWindow(int x, int y, struct Proc* parent)
{
    struct MAInfoFrameProc* proc = Proc_Start(ProcScr_MapBattleInfoBox, PROC_TREE_3);

    proc->x = x;
    proc->y = y;

    proc->maMain = parent;
}
