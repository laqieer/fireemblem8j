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


EWRAM_DATA struct HelpBoxSt gHelpBoxSt = { 0 };
extern EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo;
extern EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo;

//! FE8U = 0x0808A00C
void HelpBoxIntroDrawTexts(struct ProcHelpBoxIntro * proc)
{
    struct HelpBoxScrollProc * otherProc;
    int textSpeed;

    SetTextFont(&gHelpBoxSt.font);

    SetTextFontGlyphs(1);

    Text_SetColor(&gHelpBoxSt.text[0], 6);
    Text_SetColor(&gHelpBoxSt.text[1], 6);
    Text_SetColor(&gHelpBoxSt.text[2], 6);

    SetTextFont(0);

    Proc_EndEach(gProcScr_HelpBoxTextScroll);

    otherProc = Proc_Start(gProcScr_HelpBoxTextScroll, PROC_TREE_3);
    otherProc->font = &gHelpBoxSt.font;

    otherProc->texts[0] = &gHelpBoxSt.text[0];
    otherProc->texts[1] = &gHelpBoxSt.text[1];
    otherProc->texts[2] = &gHelpBoxSt.text[2];

    otherProc->pretext_lines = proc->pretext_lines;

    // GetStringFromIndex writes to sMsgString.buffer1, which is then used by StringInsertSpecialPrefixByCtrl a couple lines later
    GetStringFromIndex(proc->msg);

    otherProc->string = StringInsertSpecialPrefixByCtrl();
    otherProc->chars_per_step = 1;
    otherProc->step = 0;

    textSpeed = gPlaySt.config.textSpeed;
    switch (gPlaySt.config.textSpeed) {
    case 0: /* default speed */
        otherProc->speed = 2;
        break;

    case 1: /* slow */
        otherProc->speed = textSpeed;
        break;

    case 2: /* fast */
        otherProc->speed = 1;
        otherProc->chars_per_step = textSpeed;
        break;

    case 3: /* draw all at once */
        otherProc->speed = 0;
        otherProc->chars_per_step = 0x7f;
        break;
    }
}

//! FE8U = 0x0808A0FC
void StartHelpBoxTextInit(int item, int msgId)
{
    struct ProcHelpBoxIntro * proc = Proc_Start(ProcScr_HelpBoxIntro, PROC_TREE_3);

    proc->item = item;
    proc->msg = msgId;
}

//! FE8U = 0x0808A118
void ClearHelpBoxText(void) {

    SetTextFont(&gHelpBoxSt.font);

    SpriteText_DrawBackground(&gHelpBoxSt.text[0]);
    SpriteText_DrawBackground(&gHelpBoxSt.text[1]);
    SpriteText_DrawBackground(&gHelpBoxSt.text[2]);

    Proc_EndEach(gProcScr_HelpBoxTextScroll);
    Proc_EndEach(ProcScr_HelpBoxIntro);

    SetTextFont(0);

    return;
}

//! FE8U = 0x0808A160
void HelpBoxIntro_bug_0(struct HelpBoxProc * proc)
{
    UpdateHelpBoxDisplay(proc, 5);

    /* This function cannot be used */
    if (proc->timer < proc->timerMax)
    {
        proc->timer++;

#if BUGFIX
        Proc_Break(proc);
#endif
    }
}
