/* NON_MATCHING: byte source is asm/sub_800E1FC.s @ JP 0x0800E1FC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/800E1FC/residual.txt); near-match build flags: // FLAGS: -mjp-promote.
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
// Event18_ColorFade (JP sub_800E1FC) = fe8u eventscr.c:747 verbatim.
// Callees (in JP bmfx.h): EventStartFade, EventEndFade, NewEventFadefx.
// 204/204 mnemonic-identical, ~95-byte pure register permutation residual.
#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

u8 Event18_ColorFade(struct EventEngineProc * proc)
{
    u32 mask;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    s8 start = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s8 size  = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    u16 speed = proc->pEventCurrent[2];
    u16 r = proc->pEventCurrent[3];
    u16 g = proc->pEventCurrent[4];
    u16 b = proc->pEventCurrent[5];

    switch (subcode) {
    case EVSUBCMD_STARTFADE:
        EventStartFade();
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_ENDFADE:
        EventEndFade();
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_FADECOLORS:
    {
        s8 i;

        if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            speed = 0;

        mask = 0;

        for (i = size; i > 0; --i)
        {
            s8 tmp = start;
            mask = mask | (1 << tmp);
            start = tmp + 1;
        }

        NewEventFadefx(speed, mask, r, g, b, proc);

        return EVC_ADVANCE_YIELD;
    }

    default:
        return EVC_ERROR;

    } // switch (subcode)
}
