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













/* section.text */

void PhaseIntroVMatchHi()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendBCa;
    REG_BLDCB = gBmSt.altBlendBCb;

    SetNextVCount(72);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchMid);
}

void PhaseIntroVMatchMid()
{
    REG_BLDCNT = BLDCNT_TGT1_BG0
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendACa;
    REG_BLDCB = gBmSt.altBlendACb;

    SetNextVCount(96);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchLo);
}

void PhaseIntroVMatchLo()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendBCa;
    REG_BLDCB = gBmSt.altBlendBCb;

    SetNextVCount(0);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchHi);
}

void PhaseIntroText_PutText(struct PhaseIntroSubProc *proc)
{
    u16 *tm = TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 9);
    int i;

    for (i = 0; i < 0x60; ++i)
        *tm++ = TILEREF(BGCHR_PHASE_CHANGE_NAME + i, BGPAL_PHASE_CHANGE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PhaseIntroInitText(struct PhaseIntroSubProc *proc)
{
    if (GetCurrentBgmSong() != GetCurrentMapMusicIndex())
        Sound_FadeOutBGM(4);

    PlaySoundEffect(SONG_73);

    proc->timer = 15;
}

void PhaseIntroText_InLoop(struct PhaseIntroSubProc *proc)
{
    int lo, hi;

    if (0 != CheckInLinkArena()) {
        hi = 0;
        lo = -0x14;
    } else {
        hi = -8;
        lo = -0x1C;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_RCUBIC, lo, hi, proc->timer, 0x10), 0);

    gBmSt.altBlendACa++;
    gBmSt.altBlendACb--;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroText_OutLoop(struct PhaseIntroSubProc *proc)
{
    int lo, hi;

    if (0 != CheckInLinkArena()) {
        hi = -0x14;
        lo = -0x30;
    } else {
        hi = -0x1C;
        lo = -0x38;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_CUBIC, lo, hi, proc->timer, 0x10), 0);

    gBmSt.altBlendACa--;
    gBmSt.altBlendACb++;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroClearText(struct PhaseIntroSubProc *proc)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
