#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

struct Struct8012F98 {
    u8* dst;
    int unk_04;
};

/* file-scope type definitions used by this run */


struct Unk_80131A8
{
    /* 00 */ STRUCT_PAD(0x0, 0x4C);
    /* 4C */ u16 unk_4C;
};

struct Proc8599FD4 {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};

struct ProcSpacialSeTest {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

struct PalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct PalFadeSt * st;
};

struct FadeKindEnt {
    ProcPtr (* spawn_proc)(const struct ProcCmd* script, ProcPtr parent);
    void (* setup_color_fade)(u8 component_step);
    int unit;
};

/* prototypes for same-file helpers called by this run */
struct PalFadeSt *GetPalFadeSt();
void SetPalFadeStClkEnd1(int end);
void SetPalFadeStClkEnd2(int end);
void SetPalFadeStClkEnd3(int end);

void WriteFadedPaletteFromArchive(int a1, int a2, int a3, u32 mask)
{
    int i, j;
    struct PalFadeSt *st;
    u16 *buffer = gPaletteBuffer;

    SetPalFadeStClkEnd1(a1);
    SetPalFadeStClkEnd2(a2);
    SetPalFadeStClkEnd3(a3);

    st = GetPalFadeSt();

    if (a1 > 0x100) {
        a1 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = ((st[i].from_colors[j] & 0x1F) + (((0x1F - (st[i].from_colors[j] & 0x1F)) * a1) >> 8)) & 0x1F;
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = (((st[i].from_colors[j] & 0x1F) * a1) >> 8) & 0x1F;
                }
            }
        }
    }

    if (a2 > 0x100) {
        a2 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g + ((0x3E0 - g) * a2 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g * a2 >> 8);
                }
            }
        }
    }

    if (a3 > 0x100) {
        a3 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b + ((0x7C00 - b) * a3 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b * a3 >> 8);
                }
            }
        }
    }

    EnablePaletteSync();
}
