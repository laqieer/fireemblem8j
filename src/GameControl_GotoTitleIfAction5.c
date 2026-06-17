#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"
#include "opinfo.h"
#include "bm.h"
#include "bmsave.h"
#include "ending_details.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "worldmap.h"
#include "savemenu.h"
#include "gamecontrol.h"
#include "sio.h"
#include "constants/chapters.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

void GameControl_GotoTitleIfAction5(struct GameCtrlProc * proc)
{
    if (proc->nextAction == GAME_ACTION_5)
        Proc_Goto(proc, 3) /* JP routes to label 3, not US LGAMECTRL_TITLE_DIRECT (4) */;
}
