#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_TalkBubbleOpen[];

//! FE8U = 0x080083E0
void StartOpenTalkBubble(void) {
    struct Proc* proc = Proc_Start(gProcScr_TalkBubbleOpen, PROC_TREE_3);
    proc->unk64 = 0;

    return;
}
