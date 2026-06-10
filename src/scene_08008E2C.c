/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_Scene_1[];
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

//! FE8U = 0x08008F3C
bool SpriteTextScroll_BlockWhileActive(void) {
    if (Proc_Find(ProcScr_Scene_1))
        return true;

#if BUGFIX
    return false;
#endif
}

//! FE8U = 0x08008F54
void SpriteTextScroll_OnEnd(void)
{
    Proc_EndEach(ProcScr_Scene_1);
    return;
}

//! FE8U = 0x08008F64
void StartSpriteTextScroll(int chr, int b, int c, ProcPtr parent)
{
    struct TalkDebugProc * proc = Proc_Start(ProcScr_Scene_1, PROC_TREE_VSYNC);

    proc->unk_4c = (0x3FF & chr) * CHR_SIZE + 0x06010000;
    proc->unk_54 = b;
    proc->unk_58 = c;
    Proc_StartBlocking(ProcScr_Scene_0, parent);

    return;
}

//! FE8U = 0x08008FAC
void SpriteTextScroll_OnInit(struct TalkDebugProc * proc)
{
    proc->unk_64 = 0;
    return;
}
