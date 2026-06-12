#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0808E764
void StartChapterStatusScreen(ProcPtr parent)
{
    struct ChapterStatusProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gProcScr_ChapterStatusScreen, parent);
        proc->unk_3f = 0;
    }
    else
    {
        proc = Proc_Start(gProcScr_ChapterStatusScreen, PROC_TREE_3);
        proc->unk_3f = 0;
    }

    return;
}
