#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"


extern EWRAM_DATA struct HelpBoxSt gHelpBoxSt;
extern EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo;
extern EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo;
extern EWRAM_DATA struct BoxDialogueConf gBoxDialogueConf;

//! FE8U = 0x0808B788
void BoxDialogueDrawText_WaitIdle(ProcPtr proc) {
    if (Proc_Find(ProcScr_TalkBoxIdle)) {
        Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 0);
        Proc_Goto(proc, 0);
    }

    return;
}
