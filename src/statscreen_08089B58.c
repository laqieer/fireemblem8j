
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

struct SSTextDispInfo const sPage0TextInfo[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_SKLLABEL,   gUiTmScratchA + TILEMAP_INDEX(1, 3),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Skl },
    { gStatScreen.text + STATSCREEN_TEXT_SPDLABEL,   gUiTmScratchA + TILEMAP_INDEX(1, 5),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Spd },
    { gStatScreen.text + STATSCREEN_TEXT_LCKLABEL,   gUiTmScratchA + TILEMAP_INDEX(1, 7),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Lck },
    { gStatScreen.text + STATSCREEN_TEXT_DEFLABEL,   gUiTmScratchA + TILEMAP_INDEX(1, 9),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Def },
    { gStatScreen.text + STATSCREEN_TEXT_RESLABEL,   gUiTmScratchA + TILEMAP_INDEX(1, 11), TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Res },
    { gStatScreen.text + STATSCREEN_TEXT_MOVLABEL,   gUiTmScratchA + TILEMAP_INDEX(9, 1),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Mov },
    { gStatScreen.text + STATSCREEN_TEXT_CONLABEL,   gUiTmScratchA + TILEMAP_INDEX(9, 3),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Con },
    { gStatScreen.text + STATSCREEN_TEXT_AIDLABEL,   gUiTmScratchA + TILEMAP_INDEX(9, 5),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Aid },
    { gStatScreen.text + STATSCREEN_TEXT_RESCUENAME, gUiTmScratchA + TILEMAP_INDEX(9, 7),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Trv },
    { gStatScreen.text + STATSCREEN_TEXT_AFFINLABEL, gUiTmScratchA + TILEMAP_INDEX(9, 9),  TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Affin },
    { gStatScreen.text + STATSCREEN_TEXT_STATUS,     gUiTmScratchA + TILEMAP_INDEX(9, 11), TEXT_COLOR_SYSTEM_GOLD, 0, &gMid_Cnd },

    { }, // end
};

struct SSTextDispInfo const sPage1TextInfo[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_BSATKLABEL, gUiTmScratchA + TILEMAP_INDEX(2, 13), TEXT_COLOR_SYSTEM_GOLD, 6, &gMid_Atk },
    { gStatScreen.text + STATSCREEN_TEXT_BSHITLABEL, gUiTmScratchA + TILEMAP_INDEX(2, 15), TEXT_COLOR_SYSTEM_GOLD, 6, &gMid_Hit },
    { gStatScreen.text + STATSCREEN_TEXT_BSRANGE,    gUiTmScratchA + TILEMAP_INDEX(9, 11), TEXT_COLOR_SYSTEM_GOLD, 6, &gMid_Rng },
    { gStatScreen.text + STATSCREEN_TEXT_BSCRTLABEL, gUiTmScratchA + TILEMAP_INDEX(9, 13), TEXT_COLOR_SYSTEM_GOLD, 6, &gMid_Crt },
    { gStatScreen.text + STATSCREEN_TEXT_BSAVOLABEL, gUiTmScratchA + TILEMAP_INDEX(9, 15), TEXT_COLOR_SYSTEM_GOLD, 6, &gMid_Avo },

    { }, // end
};

struct SSTextDispInfo const sPage2TextInfo_Physical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gUiTmScratchA + TILEMAP_INDEX(3,  1), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Sword },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gUiTmScratchA + TILEMAP_INDEX(3,  3), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Lance },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gUiTmScratchA + TILEMAP_INDEX(11, 1), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Axe },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gUiTmScratchA + TILEMAP_INDEX(11, 3), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Bow },

    { }, // end
};

struct SSTextDispInfo const sPage2TextInfo_Magical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gUiTmScratchA + TILEMAP_INDEX(3,  1), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Anima },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gUiTmScratchA + TILEMAP_INDEX(3,  3), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Light },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gUiTmScratchA + TILEMAP_INDEX(11, 1), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Dark },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gUiTmScratchA + TILEMAP_INDEX(11, 3), TEXT_COLOR_SYSTEM_WHITE, 0, &gMid_Staff },

    { }, // end
};

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

void DisplayPage(int pageid)
{
    typedef void(*func_type)(void);

    func_type funcLut[4] =
    {
        DisplayPage0,
        DisplayPage1,
        DisplayPage2,
        DisplayPage0,
    };

    CpuFastFill(0, gUiTmScratchA, sizeof(gUiTmScratchA));
    CpuFastFill(0, gUiTmScratchC, sizeof(gUiTmScratchC));

    funcLut[pageid]();
}
