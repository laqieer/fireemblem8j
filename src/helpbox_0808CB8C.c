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
u16 GetDialogueBoxConfig(void);
void EndBoxDialogueMerge(void);

//! FE8U = 0x0808A87C
void BoxDialogue_OnIdle(struct ProcBoxDialogue* proc) {

    if (GetDialogueBoxConfig() & 0x82) {
        return;
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON)) {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x0808A8AC
void BoxDialogue_OnClose(void) {

    if (GetDialogueBoxConfig() & 0x10) {
        PlaySoundEffect(SONG_2E7);
    }

    SetTextFontGlyphs(0);
    EndBoxDialogueMerge();

    return;
}
