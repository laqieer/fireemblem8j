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

//! FE8U = 0x0800EC50
void ConvoBackgroundFade_LoadBg2(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->unkType)
    {
        case 0:
        case 3:
        case 4:
        case 5:
            while (1)
            {
            } // oh

        case 1:
            if (proc->bgIndex == BG_RANDOM)
                proc->bgIndex = NextRN_N(BG_BLANK);

            // Loading Background Tile Graphics

            Decompress(
                gConvoBackgroundData[proc->bgIndex].gfx, (void *)(VRAM + GetBackgroundTileDataOffset(BG_2)));

            // Loading Background Tile Arrangement

            CallARM_FillTileRect(
                gBG2TilemapBuffer, gConvoBackgroundData[proc->bgIndex].tsa,
                0 // base palette is bg palette 0
            );

            // Loading Background Palettes

            ApplyPalettes(gConvoBackgroundData[proc->bgIndex].pal, 0, 6);

            BG_EnableSyncByMask(BG2_SYNC_BIT);
            EnablePaletteSync();

            gPaletteBuffer[0] = 0;

            break;

        case 2:
            DisplayCGfx(gBG2TilemapBuffer, GetBackgroundTileDataOffset(BG_2), 0, 6, proc->bgIndex);

            BG_EnableSyncByMask(BG2_SYNC_BIT);
            EnablePaletteSync();

            break;
    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}
