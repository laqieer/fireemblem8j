#include "global.h"
u16 GetDialogueBoxConfig(void);
extern const struct ProcCmd ProcScr_BoxDialogueDrawTextExt[];
extern const struct ProcCmd gHelpbox_3[];
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

//! FE8U = 0x0808BAA4
void ClearBoxDialogueText(void) {
    SetTextFont(&gBoxDialogueConf.font);

    if (!(GetDialogueBoxConfig() & 1)) {
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[0]);
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[1]);
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[2]);
        if (((GetDialogueBoxConfig() & 0x10) != 0) && ((GetDialogueBoxConfig() & 0x20) == 0)) {
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[3]);
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[4]);
        }
    } else {
        int i;
        for (i = 0; i < (int)((u32)(GetDialogueBoxConfig() << 0x10) >> 0x18); i++) {
            SpriteText_DrawBackgroundExt(&gBoxDialogueConf.texts[i], 0);
        }
    }

    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    Proc_EndEach(gHelpbox_3);

    SetTextFont(NULL);

    return;
}
