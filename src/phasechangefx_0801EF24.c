#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"
#include "constants/songs.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */













void PhaseIntro_InitGraphics(ProcPtr proc)
{
    Decompress(Img_PhaseChangeUnk, BG_CHR_ADDR(0xA00));
    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_SQUARES));

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    switch (gPlaySt.faction)
    {

    case FACTION_BLUE:
        Decompress(Img_PhaseChangePlayer, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangePlayer, 18);
        break;

    case FACTION_RED:
        Decompress(Img_PhaseChangeEnemy, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangeEnemy, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangeEnemy, 18);
        break;

    case FACTION_GREEN:
        Decompress(Img_PhaseChangeOther, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangeOther, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangeOther, 18);
        break;

    }
}
