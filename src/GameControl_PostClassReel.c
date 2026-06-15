#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "gamecontrol.h"

void GameControl_PostClassReel(struct GameCtrlProc * proc)
{
    switch (proc->nextAction) {
    case GAME_ACTION_EVENT_RETURN:
        Proc_Goto(proc, 3);
        break;

    case GAME_ACTION_CLASS_REEL:
        Proc_Goto(proc, 0);
        break;
    }
}
