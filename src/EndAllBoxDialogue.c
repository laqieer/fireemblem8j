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

extern struct ProcCmd ProcScr_BoxDialogueDrawTextExt[];
extern struct ProcCmd gHelpbox_3[];

void EndAllBoxDialogue(void)
{
    Proc_EndEach(gProcScr_BoxDialogue);
    Proc_EndEach(ProcScr_TalkBoxIdle);
    Proc_EndEach(ProcScr_MergeBoxDialogue);
    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    Proc_EndEach(gHelpbox_3);
}
