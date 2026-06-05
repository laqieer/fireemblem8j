#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"

#include "constants/songs.h"

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_0[] =
{
    {
        gMapanimEventcall_23,
        gMapanimEventcall_79,
        gMapanimEventcall_135,
    },
    {
        gMapanimEventcall_24,
        gMapanimEventcall_80,
        gMapanimEventcall_136,
    },
    {
        gMapanimEventcall_25,
        gMapanimEventcall_81,
        gMapanimEventcall_137,
    },
    {
        gMapanimEventcall_26,
        gMapanimEventcall_82,
        gMapanimEventcall_138,
    },
    {
        gMapanimEventcall_27,
        gMapanimEventcall_83,
        gMapanimEventcall_139,
    },
    {
        gMapanimEventcall_28,
        gMapanimEventcall_84,
        gMapanimEventcall_140,
    },
    {
        gMapanimEventcall_29,
        gMapanimEventcall_85,
        gMapanimEventcall_141,
    },
    {
        gMapanimEventcall_30,
        gMapanimEventcall_86,
        gMapanimEventcall_142,
    },
    {
        gMapanimEventcall_31,
        gMapanimEventcall_87,
        gMapanimEventcall_143,
    },
    {
        gMapanimEventcall_32,
        gMapanimEventcall_88,
        gMapanimEventcall_144,
    },
    {
        gMapanimEventcall_33,
        gMapanimEventcall_89,
        gMapanimEventcall_145,
    },
    {
        gMapanimEventcall_34,
        gMapanimEventcall_90,
        gMapanimEventcall_146,
    },
    {
        gMapanimEventcall_35,
        gMapanimEventcall_91,
        gMapanimEventcall_147,
    },
    {
        gMapanimEventcall_36,
        gMapanimEventcall_92,
        gMapanimEventcall_148,
    },
    {
        gMapanimEventcall_37,
        gMapanimEventcall_93,
        gMapanimEventcall_149,
    },
    {
        gMapanimEventcall_38,
        gMapanimEventcall_94,
        gMapanimEventcall_150,
    },
    {
        gMapanimEventcall_39,
        gMapanimEventcall_95,
        gMapanimEventcall_151,
    },
    {
        gMapanimEventcall_40,
        gMapanimEventcall_96,
        gMapanimEventcall_152,
    },
    {
        gMapanimEventcall_41,
        gMapanimEventcall_97,
        gMapanimEventcall_153,
    },
    {
        gMapanimEventcall_42,
        gMapanimEventcall_98,
        gMapanimEventcall_154,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_1[] =
{
    {
        gMapanimEventcall_43,
        gMapanimEventcall_99,
        gMapanimEventcall_155,
    },
    {
        gMapanimEventcall_44,
        gMapanimEventcall_100,
        gMapanimEventcall_156,
    },
    {
        gMapanimEventcall_45,
        gMapanimEventcall_101,
        gMapanimEventcall_157,
    },
    {
        gMapanimEventcall_46,
        gMapanimEventcall_102,
        gMapanimEventcall_158,
    },
    {
        gMapanimEventcall_47,
        gMapanimEventcall_103,
        gMapanimEventcall_159,
    },
    {
        gMapanimEventcall_48,
        gMapanimEventcall_104,
        gMapanimEventcall_160,
    },
    {
        gMapanimEventcall_49,
        gMapanimEventcall_105,
        gMapanimEventcall_161,
    },
    {
        gMapanimEventcall_50,
        gMapanimEventcall_106,
        gMapanimEventcall_162,
    },
    {
        gMapanimEventcall_51,
        gMapanimEventcall_107,
        gMapanimEventcall_163,
    },
    {
        gMapanimEventcall_52,
        gMapanimEventcall_108,
        gMapanimEventcall_164,
    },
    {
        gMapanimEventcall_53,
        gMapanimEventcall_109,
        gMapanimEventcall_165,
    },
    {
        gMapanimEventcall_54,
        gMapanimEventcall_110,
        gMapanimEventcall_166,
    },
    {
        gMapanimEventcall_55,
        gMapanimEventcall_111,
        gMapanimEventcall_167,
    },
    {
        gMapanimEventcall_56,
        gMapanimEventcall_112,
        gMapanimEventcall_168,
    },
    {
        gMapanimEventcall_57,
        gMapanimEventcall_113,
        gMapanimEventcall_169,
    },
    {
        gMapanimEventcall_58,
        gMapanimEventcall_114,
        gMapanimEventcall_170,
    },
    {
        gMapanimEventcall_59,
        gMapanimEventcall_115,
        gMapanimEventcall_171,
    },
    {
        gMapanimEventcall_60,
        gMapanimEventcall_116,
        gMapanimEventcall_172,
    },
    {
        gMapanimEventcall_61,
        gMapanimEventcall_117,
        gMapanimEventcall_173,
    },
    {
        gMapanimEventcall_62,
        gMapanimEventcall_118,
        gMapanimEventcall_174,
    },
    {
        gMapanimEventcall_63,
        gMapanimEventcall_119,
        gMapanimEventcall_175,
    },
    {
        gMapanimEventcall_64,
        gMapanimEventcall_120,
        gMapanimEventcall_176,
    },
    {
        gMapanimEventcall_65,
        gMapanimEventcall_121,
        gMapanimEventcall_177,
    },
    {
        gMapanimEventcall_66,
        gMapanimEventcall_122,
        gMapanimEventcall_178,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_2[] =
{
    {
        gMapanimEventcall_67,
        gMapanimEventcall_123,
        gMapanimEventcall_179,
    },
    {
        gMapanimEventcall_68,
        gMapanimEventcall_124,
        gMapanimEventcall_180,
    },
    {
        gMapanimEventcall_69,
        gMapanimEventcall_125,
        gMapanimEventcall_181,
    },
    {
        gMapanimEventcall_70,
        gMapanimEventcall_126,
        gMapanimEventcall_182,
    },
    {
        gMapanimEventcall_71,
        gMapanimEventcall_127,
        gMapanimEventcall_183,
    },
    {
        gMapanimEventcall_72,
        gMapanimEventcall_128,
        gMapanimEventcall_184,
    },
    {
        gMapanimEventcall_73,
        gMapanimEventcall_129,
        gMapanimEventcall_185,
    },
    {
        gMapanimEventcall_74,
        gMapanimEventcall_130,
        gMapanimEventcall_186,
    },
    {
        gMapanimEventcall_75,
        gMapanimEventcall_131,
        gMapanimEventcall_187,
    },
    {
        gMapanimEventcall_76,
        gMapanimEventcall_132,
        gMapanimEventcall_188,
    },
    {
        gMapanimEventcall_77,
        gMapanimEventcall_133,
        gMapanimEventcall_189,
    },
    {
        gMapanimEventcall_78,
        gMapanimEventcall_134,
        gMapanimEventcall_190,
    },
};



void MapEventcallFx0_Init(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;
}

// clang-format on

void MapEventcallFx0_PlayIntroAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_140, proc->xDisplay);
        }
        else if (proc->frame > 19)
        {
            proc->frame = 0;
            proc->timer = 0;
            proc->unk44 = 1;

            SetDispEnable(0, 0, 0, 0, 0);

            Proc_Break(proc);
            return;
        }

        Decompress(
            MapAnimfxConf_MapanimEventcall_0[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44] * 0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_0[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_MapanimEventcall_0[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
        EnablePaletteSync();

        proc->frame++;
        proc->timer = 3;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

// clang-format on

void MapEventcallFx0_PlayMainAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        Decompress(
            MapAnimfxConf_MapanimEventcall_1[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_1[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_MapanimEventcall_1[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
        EnablePaletteSync();

        if (proc->frame == 0)
        {
            SetDispEnable(0, 0, 1, 0, 0);
        }
        else if (proc->frame > 22)
        {
            Proc_Break(proc);
        }

        proc->timer = gMapanimEventcall_2[proc->frame];
        proc->frame++;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

void MapEventcallFx0_FillWhiteTile(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        proc->frame = 0;

        CpuFastFill(-1, (void*) VRAM + 0x20 * 0x2FF, 0x20);

        TileMap_FillRect(gBG0TilemapBuffer, 30, 20, TILEREF(0x2FF, 3));
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        PAL_BG_COLOR(3, 15) = 0;
        EnablePaletteSync();

        SetDispEnable(1, 0, 1, 0, 0);

        Proc_Break(proc);
    }
    proc->timer--;
}

void MapEventcallFx0_RampToWhite(struct MAEffectProc * proc)
{
    u16 brightness = proc->frame * 4;

    if (proc->frame < 8)
    {
        PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);
    }
    else
    {
        PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
        Proc_Break(proc);
    }

    EnablePaletteSync();
    proc->frame++;
}

void MapEventcallFx0_ClearBg2(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void StartMapEventcallFx1(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_1, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_1, PROC_TREE_3);
}

void MapEventcallFx1_Init(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
    EnablePaletteSync();

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->unk48 = 119;
}

void MapEventcallFx1_FadeWhiteDown(struct MAEffectProc * proc)
{
    int brightness = proc->unk48 * 32 / 120;
    PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);

    EnablePaletteSync();

    proc->unk48--;

    if (proc->unk48 < 31)
        Proc_Break(proc);
}

void MapEventcallFx1_PlayFadeAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame != 0)
        {
            if (proc->frame > 11)
            {
                proc->frame = proc->timer;
                Proc_Break(proc);
                return;
            }
        }
        else
        {
            SetDispEnable(0, 0, 1, 1, 1);
        }

        Decompress(
            MapAnimfxConf_MapanimEventcall_2[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_2[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        if (proc->unk48 < 0)
        {
            ApplyPalette(MapAnimfxConf_MapanimEventcall_2[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
            EnablePaletteSync();
        }

        proc->frame_idx = proc->frame;
        proc->frame++;

        proc->timer = 4;

        proc->unk4C = proc->unk44;
        proc->unk44 ^= 1;
    }

    proc->timer--;

    if (proc->unk48 >= 0)
    {
        int i, addedBrightness = proc->unk48 * 32 / 240;

        const u16 * const in  = MapAnimfxConf_MapanimEventcall_2[proc->frame_idx].pal;
        u16 *       const out = &gPaletteBuffer[0x10 * gMapanimEventcall_1[proc->unk4C]];

        for (i = 1; i < 16; ++i)
        {
            u32 r = RED_VALUE(in[i]);
            u32 g = GREEN_VALUE(in[i]);
            u32 b = BLUE_VALUE(in[i]);

            r = r + addedBrightness > 31 ? 31 : r + addedBrightness;
            g = g + addedBrightness > 31 ? 31 : g + addedBrightness;
            b = b + addedBrightness > 31 ? 31 : b + addedBrightness;

            out[i] = RGB(r, g, b);
        }

        EnablePaletteSync();

        proc->unk48--;
    }
}

void MapEventcallFx1_ClearBgs(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG2_SYNC_BIT);
}

void StartMapEventcallFx2(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_2, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_2, PROC_TREE_3);
}

void MapEventcallFx2_OnEnd(void)
{
    SetSecondaryHBlankHandler(NULL);
    Proc_EndEach(ProcScr_MapanimEventcall_3);
}

void MapEventcallFx2_Init(struct MAEffectProc * proc)
{
    struct Proc8080050 * vsync;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    gUnk_57 = 0;

    vsync = Proc_Start(ProcScr_MapanimEventcall_3, PROC_TREE_VSYNC);

    vsync->unk29 = 0;
    vsync->unk2A = 0;

    SetSecondaryHBlankHandler(MapEventcallFx2_HBlankWobble);
}
