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

//! FE8U = 0x0808B0D4
void BoxDialogue_StopFaceMouthMove(void) {

    if (GetDialogueBoxConfig() & 4) {
        SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) &~ 0x10);
    }

    return;
}
