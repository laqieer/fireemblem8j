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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gHelpbox_3[];

//! FE8U = 0x0808BA60
void StartBoxDialogueDrawText(int msgId, int x, int y) {
    struct HelpBox8A01800Proc* proc = Proc_Start(gHelpbox_3, PROC_TREE_3);

    proc->unk_5c = msgId;

    proc->unk_2c = x / 8;

    if (y / 16 < 6) {
        if (y / 16 < 0) {
            proc->unk_30 = 0;
            return;
        } else {
            proc->unk_30 = y / 16;
            return;
        }
    }

    proc->unk_30 = 5;

    return;
}
