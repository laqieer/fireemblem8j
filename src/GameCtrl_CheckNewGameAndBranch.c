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

void GameCtrl_CheckNewGameAndBranch(struct GameCtrlProc* proc) {
    if ((gPlaySt.save_menu_type == 2) || (gPlaySt.save_menu_type == 4)) {
        Proc_Goto(proc, 5) /* JP routes to label 5, not US LGAMECTRL_EXEC_BM_EXT (6) */;
    }

    return;
}
