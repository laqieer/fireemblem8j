#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08068D9C
void efxDarkGradoRestoreMapBg(void)
{
    if (gBanimBG == 0)
    {
        EfxChapterMapFadeOUT(4);
    }
    else
    {
        PutBanimBgPAL(gBanimBG - 1);
        EfxPalBlackInOut(gPaletteBuffer, 6, 10, 0);
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x08068DD8
void efxDarkGradoBG01_OnHBlank_13(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xd);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E14
void efxDarkGradoBG01_OnHBlank_12(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xc);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E50
void efxDarkGradoBG01_OnHBlank_11(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xb);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E8C
void efxDarkGradoBG01_OnHBlank_10(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xa);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068EC8
void efxDarkGradoBG01_OnHBlank_9(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 9);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F04
void efxDarkGradoBG01_OnHBlank_8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 8);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F40
void efxDarkGradoBG01_OnHBlank_7(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 7);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F7C
void efxDarkGradoBG01_OnHBlank_6(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 6);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068FB8
void efxDarkGradoBG01_OnHBlank_5(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 5);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068FF4
void efxDarkGradoBG01_OnHBlank_4(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 4);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08069030
void efxDarkGradoBG01_OnHBlank_3(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 3);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x0806906C
void efxDarkGradoBG01_OnHBlank_2(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 2);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x080690A8
void efxDarkGradoBG01_OnHBlank_1(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 1);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x080690E4
void efxDarkGradoBG01_OnHBlank_0(void)
{
    u16 vcount = REG_VCOUNT + 1;
    REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10;
    return;
}
