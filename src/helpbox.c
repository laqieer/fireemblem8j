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



EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo = { 0 };
EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo = NULL;

//! FE8U = 0x0808A1E0
void StartHelpBoxAtPos(int x, int y, int msgId) {

    gTmpHelpBoxInfo.xDisplay = x;
    gTmpHelpBoxInfo.yDisplay = y;
    gTmpHelpBoxInfo.mid = msgId;
    gTmpHelpBoxInfo.redirect = 0;
    gTmpHelpBoxInfo.populate = 0;

    StartHelpBoxMoveCtrl(&gTmpHelpBoxInfo);

    return;
}

//! FE8U = 0x0808A200
void StartHelpBoxExtInternal(const struct HelpBoxInfo* info) {
    int wTextBox;
    int hTextBox;

    struct HelpBoxProc * proc = Proc_Find(ProcScr_Helpbox_bug_0);

    if (!proc) {
        proc = Proc_Start(ProcScr_Helpbox_bug_0, PROC_TREE_3);

        PlaySoundEffect(SONG_70);

        SetHelpBoxInitPosition_bug(proc, info->xDisplay, info->yDisplay);

        SetHelpBoxDefaultRect(proc);
    } else {
        proc->xBoxInit = proc->xBox;
        proc->yBoxInit = proc->yBox;
        proc->wBoxInit = proc->wBoxFinal;
        proc->hBoxInit = proc->hBoxFinal;
    }

    proc->info = info;
    proc->timer = 0;
    proc->timerMax = 12;

    proc->mid = info->mid;

    SetTextFontGlyphs(1);

    GetStringTextBox(GetStringFromIndex(proc->mid), &wTextBox, &hTextBox);

    SetTextFontGlyphs(0);

    ApplyHelpBoxContentSize_bug(proc, wTextBox, hTextBox);
    ApplyHelpBoxPosition_bug(proc, info->xDisplay, info->yDisplay);

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->mid);

    gpHelpBoxCurrentInfo = info;

    return;
}

//! FE8U = 0x0808A2D0
void CloseHelpBox_bug(void) {

    PlaySoundEffect(SONG_71);

    ClearHelpBoxText();

    Proc_BreakEach(ProcScr_Helpbox_bug_0);

    return;
}

//! FE8U = 0x0808A2FC
void HelpBoxMoveCtrl_OnInitBox(struct HelpBoxProc * proc) {

    proc->moveKey = 0;

    if (proc->info->redirect) {
        proc->info->redirect(proc);
    }

    StartHelpBoxExtInternal(proc->info);

    return;
}

//! FE8U = 0x0808A320
void HelpBoxMoveCtrl_OnIdle(struct HelpBoxProc * proc) {

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808A340
void EndHelpBoxMoveCtrl(struct HelpBoxProc * proc) {

    CloseHelpBox_bug();
    Proc_End(proc);

    return;
}

//! FE8U = 0x0808A354
void StartHelpBoxMoveCtrl(const struct HelpBoxInfo* info) {
    struct HelpBoxProc * proc = Proc_Start(gHelpbox_0, PROC_TREE_3);

    proc->info = info;

    return;
}

//! FE8U = 0x0808A36C
s8 IsHelpBoxMoveCtrlActive(void) {
    return Proc_Find(gHelpbox_0) ? 1 : 0;
}

//! FE8U = 0x0808A384
void ApplyHelpBoxContentSize_bug(struct HelpBoxProc * proc, int w, int h) {

    w = (w + 0x1f) & 0xe0;

    switch (GetHelpBoxItemInfoKind_bug(proc->item)) {
        case 1:
            w = 0xA0;
            h = h + 0x20;

            break;

        case 2:
            if (w < 0x60) {
                w = 0x60;
            }

            h = h + 0x10;

            break;
    }

    proc->wBoxFinal = w;
    proc->hBoxFinal = h;

    return;
}
