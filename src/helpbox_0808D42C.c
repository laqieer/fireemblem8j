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
u16 GetDialogueBoxConfig(void);

//! FE8U = 0x0808B11C
void BoxDialogue_ClearTextLines(struct ProcBoxDialogueDrawTextExt* proc) {

    SpriteText_DrawBackground(&gBoxDialogueConf.texts[0]);
    SpriteText_DrawBackground(&gBoxDialogueConf.texts[1]);
    SpriteText_DrawBackground(&gBoxDialogueConf.texts[2]);

    if (GetDialogueBoxConfig() & 0x10) {
        if (!(GetDialogueBoxConfig() & 0x20)) {
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[3]);
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[4]);
        }
    }

    proc->timer = 0;
    proc->current_line = 0;

    return;
}
