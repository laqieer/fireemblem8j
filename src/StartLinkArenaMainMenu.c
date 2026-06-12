#include "global.h"
#include "bmsave.h"
#include "bmlib.h"
#include "face.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmio.h"
#include "uiutils.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_SIOMENU[];

// clang-format on

//! FE8U = 0x080481E0
void StartLinkArenaMainMenu(ProcPtr parent)
{
    LoadUiFrameGraphics();
    InitTextFont(&Font_0, BG_CHR_ADDR(0xC0), 0xc0, 0);

    if (!IsSaveValid(SAVE_ID_ARENA))
    {
        WriteNewMultiArenaSave();
    }

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    SetBmStLinkArenaFlag();
    LinkArenaBattleMap_InitChapter();

    BMapVSync_Start();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_COMPLETE;
    gPlaySt.config.windowColor = 0;

    Proc_StartBlocking(ProcScr_SIOMENU, parent);
    Proc_Start(ProcScr_DebugMonitor, PROC_TREE_3);

    return;
}
