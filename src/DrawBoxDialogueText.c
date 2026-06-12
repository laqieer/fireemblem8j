extern int ApplyBoxDialoguePosition();
extern int GetDialogueBoxConfig();
extern int SetBoxDialogueSize();
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

//! FE8U = 0x0808AC0C
void DrawBoxDialogueText(int x, int y, int msg) {
    struct HelpBoxProc * proc;

    int wInner = 0;
    int hInner = 0;

    Proc_EndEach(ProcScr_MergeBoxDialogue);

    proc = Proc_Start(ProcScr_MergeBoxDialogue, PROC_TREE_3);

    SetHelpBoxInitPosition(proc, x, y);
    ResetHelpBoxInitSize(proc);

    proc->info = NULL;
    proc->timer = 0;

    if (GetDialogueBoxConfig() & 1) {
        proc->timerMax = 0;
    } else {
        proc->timerMax = 0xc;
    }

    proc->item = 0;

    proc->mid = msg;

    SetTextFontGlyphs(1);

    // ??
    GetStringFromIndex(proc->mid);

    GetBoxDialogueSize(StringInsertSpecialPrefixByCtrl(), &wInner, &hInner);

    SetTextFontGlyphs(0);

    SetBoxDialogueSize(proc, wInner, hInner);

    if ((GetDialogueBoxConfig() & 0x100) != 0) {
        x = x + (0xd8 - proc->wBoxFinal) / 2;
        y = y + (0x90 - proc->hBoxFinal) / 2;
    }

    ApplyBoxDialoguePosition(proc, x, y);

    ClearBoxDialogueText();

    StartBoxDialogueDrawText(proc->mid, wInner, hInner);

    return;
}
