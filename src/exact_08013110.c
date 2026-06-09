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

void ApplyBitmap(const void* src, void* dst, int width, int height)
{
    int i, line_size;

    if (height <= 0)
        return;

    line_size = 8 * 8 * width;

    for (i = height; i != 0; --i) {
        ApplyBitmapLine(src, dst, width);

        src += line_size;
        dst += CHR_SIZE * width;
    }
}

void ApplyBitmapLine(const void *src, void *dst, int width)
{
    int i;

    if (width <= 0)
        return;

    for (i = width; i != 0; i--) {
        ApplyBitmapTile(src, dst, width);

        src += 8;
        dst += CHR_SIZE;
    }
}

void ApplyBitmapTile(const u8 *src, u32 *dst, int width)
{
    int i;

    for (i = 0; i < 8; ++i) {
        u32 value = 0;

        value |= src[7];

        value <<= 4;
        value |= src[6];

        value <<= 4;
        value |= src[5];

        value <<= 4;
        value |= src[4];

        value <<= 4;
        value |= src[3];

        value <<= 4;
        value |= src[2];

        value <<= 4;
        value |= src[1];

        value <<= 4;
        value |= src[0];

        *dst++ = value;
        src += width * 8;
    }
}

void PutAppliedBitmap(u16 * tm, int tileref, int width, int height)
{
    int ix, iy;

    for (iy = 0; iy < height; ++iy)
        for (ix = 0; ix < width; ++ix)
            tm[TILEMAP_INDEX(ix, iy)] = tileref++;
}
