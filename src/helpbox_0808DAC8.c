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

/* prototypes for same-file helpers called by this run */
void ScrollBoxDialogueTilesUp(int a, int b);

//! FE8U = 0x0808B7B8
void BoxDialogueDrawText_ScrollLines(struct ProcBoxDialogueDrawTextExt* proc) {
    ScrollBoxDialogueTilesUp(proc->unk_54 + 1, proc->unk_55);

    proc->timer++;

    if (proc->timer == 16) {
        Text_SetCursor(&gBoxDialogueConf.texts[proc->current_line], 0);
        Proc_Break(proc);
    }

    return;
}
