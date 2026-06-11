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



extern EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo;
extern EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo;

/* prototypes for same-file helpers called by this run */
void SetBoxDialogueSize(struct HelpBoxProc * proc, int w, int h);

//! FE8U = 0x0808B844
void BoxDialogueDrawText_Finish(ProcPtr proc) {
    Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 3);
    Proc_Break(proc);

    SetTextFont(NULL);
    SetTextFontGlyphs(0);

    return;
}

//! FE8U = 0x0808B870
void BoxDialogueDrawText_ResizeBox(struct ProcBoxDialogueDrawTextExt* proc) {
    struct HelpBoxProc * helpBoxProc = Proc_Find(ProcScr_MergeBoxDialogue);

    proc->timer++;

    if (helpBoxProc) {
        int x = (proc->unk_54 * (2 - proc->timer) + proc->timer * proc->unk_56) / 2;
        int y = (proc->unk_55 * (2 - proc->timer) + proc->timer * proc->unk_57) / 2;

        SetBoxDialogueSize(helpBoxProc, x, y);
    }

    if (proc->timer == 2) {
        u8 tmp;

        proc->unk_54 = proc->unk_56 / 8;

        tmp = proc->unk_57 / 16;
        proc->unk_55 = tmp < 5 ? tmp : 5;

        Proc_Break(proc);
    }

    return;
}
