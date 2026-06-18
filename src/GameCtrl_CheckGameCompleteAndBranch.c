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

void GameCtrl_CheckGameCompleteAndBranch(struct GameCtrlProc* proc) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        return;
    }

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)) {
        return;
    }

    Proc_Goto(proc, 16); /* JP: goto PROC_LABEL(16) post-completion path, not EXEC_ENDING_SCENE */

    return;
}
