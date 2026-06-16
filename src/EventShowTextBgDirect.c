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


u8 EventShowTextBgDirect(u8 mode, u16 bgIndex)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    switch (mode)
    {

        case EVSUBCMD_TEXTSTART:
            return EVC_ERROR;

        case EVSUBCMD_TUTORIALTEXTBOXSTART:
            return EVC_ERROR;

        case EVSUBCMD_SOLOTEXTBOXSTART:
            return EVC_ERROR;

        case EVSUBCMD_0x1A25:
            return EVC_ERROR;

        case EVSUBCMD_REMOVEPORTRAITS:
            // Randomize background (for support viewers)
            if (bgIndex == 0x51)
                bgIndex = NextRN_N(0x4f);

            // Loading Background Tile Graphics

            Decompress(gConvoBackgroundData[bgIndex].gfx, (void *)(VRAM + GetBackgroundTileDataOffset(3)));

            // Loading Background Tile Arrangement

            CallARM_FillTileRect(
                gBG3TilemapBuffer, gConvoBackgroundData[bgIndex].tsa,
                0x8000 // base palette is bg palette 8
            );

            // Loading Background Palettes

            ApplyPalettes(gConvoBackgroundData[bgIndex].pal, 8, 8);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            gPaletteBuffer[0] = 0;

            return EVC_ADVANCE_YIELD;

        case EVSUBCMD_0x1A22:
            DisplayCGfx(gBG3TilemapBuffer, GetBackgroundTileDataOffset(BG_3), 8, 8, bgIndex);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            return EVC_ADVANCE_YIELD;

        default:
            return EVC_ADVANCE_YIELD;

    } // switch (mode)
}
