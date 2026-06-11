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

//! FE8U = 0x0808B904
s8 BoxDialogueShouldAnimateText(void) {
    struct ProcBoxDialogue* proc = Proc_Find(gProcScr_BoxDialogue);

    if (!proc) {
        return 1;
    }

    if (proc->unk_38 != 0) {
        return 1;
    }

    return 0;
}
