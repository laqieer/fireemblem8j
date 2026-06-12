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
void DialogBoxGetGlyphLen(const char* str, u8* xOut);

//! FE8U = 0x0808B09C
void BoxDialogueDrawText_Init(struct ProcBoxDialogueDrawTextExt* proc) {
    struct HelpBoxProc * helpBoxProc = Proc_Find(ProcScr_MergeBoxDialogue);

    proc->unk_59 = 0;
    proc->unk_50 = helpBoxProc->xBox - 8;
    proc->unk_51 = helpBoxProc->yBox - 8;

    DialogBoxGetGlyphLen(proc->str, &proc->x_offset);

    return;
}
