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

extern u8 gGfx_Titlescreen_4[];
extern u16 gPal_Titlescreen_5[];

//! FE8U = 0x080C58CC
void Title_SetupSpecialEffectGraphics(struct TitleScreenProc* proc) {
    int i;

    switch (proc->timer) {
        case 0:
            SetBackgroundTileDataOffset(0, 0xc000);
            SetBackgroundMapDataOffset(0, 0x7800);

            Decompress(gGfx_Titlescreen_2, (void*)0x06008000);
            Decompress(gTsa_Titlescreen_2, (void*)0x0600B000);
            ApplyPalette(gPal_Titlescreen_3, 0);
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0x7FFF; // White
            break;

        case 1:
            Decompress(gGfx_Titlescreen_0, (void*)0x0600C000);
            Decompress(gTsa_Titlescreen_0, gBG0TilemapBuffer);
            ApplyPalette(gPal_Titlescreen_1, 1);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x1000;
            }

            BG_EnableSyncByMask(1);
            break;

        case 2:
            Decompress(gGfx_Titlescreen_1, (void*)0x0600D000);
            Decompress(gTsa_Titlescreen_1, gBG0TilemapBuffer);
            ApplyPalette(gPal_Titlescreen_2, 2);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x2080;
            }
            break;

        case 3:
            Decompress(gGfx_TitleLargeGlowingOrb, (void*)0x06014400);
            ApplyPalettes(gPal_TitleLargeGlowingOrb, 0x14, 3);
            Decompress(gGfx_TitleSmallLightBubbles, (void*)0x06015400);
            ApplyPalette(gPal_TitleSmallLightBubbles, 0x17);
            break;

        case 4:
            Decompress(gGfx_Titlescreen_4, (void*)0x06015800);
            ApplyPalette(gPal_Titlescreen_5, 0x18);
            proc->timer = 0;
            Proc_Break(proc);
            return;
    }

    proc->timer++;
}
