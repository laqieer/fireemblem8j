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



extern struct ProcCmd  ProcScr_BoxDialogueDrawTextExt[];
u16 GetDialogueBoxConfig(void);
s8 BoxDialogueShouldAnimateText(void);

void BoxDialogueDrawTextProc_Init(struct HelpBox8A01800Proc * proc) {
    struct ProcBoxDialogueDrawTextExt * otherProc;

    SetTextFont(&gBoxDialogueConf.font);
    SetTextFontGlyphs(0);
    SetTextFontGlyphs(1);

    if ((GetDialogueBoxConfig() & 1) == 0) {
        Text_SetColor(&gBoxDialogueConf.texts[0], 6);
        Text_SetColor(&gBoxDialogueConf.texts[1], 6);
        Text_SetColor(&gBoxDialogueConf.texts[2], 6);
        if (((GetDialogueBoxConfig() & 0x10) != 0) && ((GetDialogueBoxConfig() & 0x20) == 0)) {
            Text_SetColor(&gBoxDialogueConf.texts[3], 6);
            Text_SetColor(&gBoxDialogueConf.texts[4], 6);
        }
    } else {
        int i;

        for (i = 0; i < (int)((u32)(GetDialogueBoxConfig() << 0x10) >> 0x18); i++) {
            Text_SetColor(&gBoxDialogueConf.texts[i], 0);
        }
    }

    SetTextFont(NULL);

    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    otherProc = Proc_Start(ProcScr_BoxDialogueDrawTextExt, PROC_TREE_3);

    otherProc->unk_30 = &gBoxDialogueConf.font;
    otherProc->texts[0] = &gBoxDialogueConf.texts[0];
    otherProc->texts[1] = &gBoxDialogueConf.texts[1];
    otherProc->texts[2] = &gBoxDialogueConf.texts[2];
    otherProc->texts[3] = &gBoxDialogueConf.texts[3];
    otherProc->texts[4] = &gBoxDialogueConf.texts[4];
    otherProc->current_line = 0;

    GetStringFromIndex(proc->unk_5c);

    otherProc->str = StringInsertSpecialPrefixByCtrl();
    otherProc->unk_54 = proc->unk_2c;
    otherProc->unk_55 = proc->unk_30;

    if (BoxDialogueShouldAnimateText() != 0) {
        otherProc->unk_4c = GetTextDisplaySpeed();

        otherProc->unk_4e = otherProc->unk_4c != 0 ? 1 : 0x80;
    } else {
        otherProc->unk_4c = 0;
        otherProc->unk_4e = 0x80;
    }

    otherProc->unk_4a = 0;

    return;
}
