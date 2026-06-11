
#include "global.h"

#include <stdlib.h>

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"

#include "statscreen.h"
#include "constants/songs.h"

extern struct StatScreenInfo EWRAM_DATA sStatScreenInfo;
extern struct HelpBoxInfo EWRAM_DATA sMutableHbi;
extern const struct HelpBoxInfo * EWRAM_DATA sLastHbi;
extern struct Vec2 EWRAM_DATA sHbOrigin;

extern EWRAM_OVERLAY(0) struct StatScreenSt gStatScreen;
extern EWRAM_OVERLAY(0) u16 gUiTmScratchA[0x280];
extern EWRAM_OVERLAY(0) u16 gUiTmScratchB[0x280];
extern EWRAM_OVERLAY(0) u16 gUiTmScratchC[0x240];









extern struct TextInitInfo CONST_DATA sSSMasterTextInitInfo[];







extern struct ProcCmd CONST_DATA gProcScr_SSUnitSlide[];







extern u16 CONST_DATA sSprite_PageNameBack[];

extern u16 const* CONST_DATA sPageNameSpriteLut[];

extern u16 CONST_DATA sPageNameChrOffsetLut[]; // tile offsets within an image







extern struct ProcCmd CONST_DATA gProcScr_StatScreen[];

extern struct ProcCmd CONST_DATA gProcScr_HelpBox[];

extern struct ProcCmd CONST_DATA gProcScr_HelpBoxMoveCtrl[];

extern struct ProcCmd CONST_DATA gProcScr_HelpBoxLock[];

extern u16 CONST_DATA sSprite_MetaHelp[];

extern struct ProcCmd CONST_DATA gProcScr_HelpPromptSpr[];

/* file-scope type definitions used by this run */


enum
{
    // Magical constants

    // Neutral left arrow position
    PAGENUM_LEFTARROW_X = 103,
    PAGENUM_LEFTARROW_Y = 3,

    // Neutral right arrow position
    PAGENUM_RIGHTARROW_X = 217,
    PAGENUM_RIGHTARROW_Y = 3,

    // initial arrow offset on select
    PAGENUM_SELECT_XOFF = 6,

    // arrow animation speeds
    PAGENUM_ANIMSPEED = 4,
    PAGENUM_SELECT_ANIMSPEED = 31,

    PAGENUM_DISPLAY_X = 215,
    PAGENUM_DISPLAY_Y = 17,

    // name animation scaling time
    PAGENAME_SCALE_TIME = 6,
};

/* prototypes for same-file helpers called by this run */
void SetHelpBoxInitPosition(struct HelpBoxProc* proc, int x, int y);
void ResetHelpBoxInitSize(struct HelpBoxProc* proc);

void HelpBox_OnClose(struct HelpBoxProc* proc)
{
    struct Proc* found = Proc_Find(gProcScr_HelpPromptSpr);

    if (found)
        found->proc_lockCnt = 0; // unlock (enable) proc

    if (proc->unk52 == 0)
    {
        PlaySoundEffect(SONG_71);

        ResetHelpBoxInitSize(proc);
        SetHelpBoxInitPosition(proc, proc->info->xDisplay, proc->info->yDisplay);
    }
}
