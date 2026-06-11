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
void LoadHelpBoxGfx(void * vram, int palId);
void StartHelpBoxAtPos(int x, int y, int msgId);

//! FE8U = 0x0808A444
void SetHelpBoxDefaultRect(struct HelpBoxProc * proc) {
    proc->wBoxInit = 0x20;
    proc->hBoxInit = 0x10;

    return;
}

//! FE8U = 0x0808A454
int GetHelpBoxItemInfoKind_bug(int item) {

    if (item == (u16)-2) {
        return 3;
    }

    if (GetItemAttributes(item) & IA_LOCK_3) {
        return 0;
    }

    if (GetItemAttributes(item) & IA_WEAPON) {
        return 1;
    }

    if (GetItemAttributes(item) & IA_STAFF) {
        return 2;
    }

    return 0;
}

//! FE8U = 0x0808A4A4
void HelpBoxLock_OnIdle(ProcPtr proc) {
    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808A4C4
s8 StartHelpoxDirect(int msgId, ProcPtr parent) {
    LoadHelpBoxGfx(0, -1);

    StartHelpBoxAtPos(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgId);

    Proc_StartBlocking(gHelpbox_1, parent);

    return 1;
}
