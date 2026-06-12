#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080C56F4
void Title_SetupMainGraphics(struct TitleScreenProc * proc)
{
    int i;

    switch (proc->timer) {
    case 0:
        Decompress(gGfx_TitleMainBackground_1, (void*)VRAM);

        break;

    case 1:
        Decompress(gGfx_TitleMainBackground_2, (void*)0x06003000);
        Decompress(gTsa_TitleMainBackground, gBG1TilemapBuffer);
        ApplyPalette(gPal_TitleMainBackground, 0xE);

        for (i = 0; i < 0x280; i++)
            gBG1TilemapBuffer[i] += 0xE000;

        if (proc->mode != 0)
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0x7FFF; // White
        else
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;

        break;

    case 2:
        Decompress(gGfx_TitleDragonForeground, (void*)0x06005000);
        Decompress(gTsa_TitleDragonForeground, gBG0TilemapBuffer);
        ApplyPalette(gPal_TitleDragonForeground, 0xF);

        for (i = 0; i < 0x280; i++)
            gBG0TilemapBuffer[i] += 0xF280;

        BG_EnableSyncByMask(1);
        break;

    case 3:
        Decompress(gGfx_FireEmblemLogo, (void*)0x06010000);
        break;

    case 4:
        Decompress(gGfx_SubtitlePressStart, (void*)0x6012800);
        ApplyPalettes(gPal_PressStart, 0x10, 4);
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}
