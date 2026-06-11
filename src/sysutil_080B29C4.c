#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void BgAffinRotScalingHighPrecision(u8 bg, int angle, int texX, int texY, int sx, int sy)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    if (sx <= 0x400)
        sx = 0x400;

    if (sy <= 0x400)
        sy = 0x400;

    data.texX = texX;
    data.texY = texY;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x1000000 / sx;
    data.sy = 0x1000000 / sy;
    data.alpha = angle >> 4;

    dst = &gLCDControlBuffer.bg3affin;
    if (bg == BG_2)
        dst = &gLCDControlBuffer.bg2affin;

    BgAffineSet(&data, dst, 1);
}

void BgAffinScalingHighPrecision(u8 bg, int sy, int sx)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->pb = (affin->pb * sy) >> 0x10;
    affin->pd = (affin->pd * sy) >> 0x10;
    affin->pa = (affin->pa * sx) >> 0x10;
    affin->pc = (affin->pc * sx) >> 0x10;
}

void BgAffinAnchoringHighPrecision(u8 bg, int q0_x, int q0_y, int p0_x, int p0_y)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->dx = ((affin->pa * (-q0_x) + affin->pb * (-q0_y)) >> 8) + p0_x;
    affin->dy = ((affin->pc * (-q0_x) + affin->pd * (-q0_y)) >> 8) + p0_y;
}

void Mode4BlitRect(int a, u16 * buf, int c, int d, int e, int f, int g, int h)
{
    int i, ip, r4;
    u16 * r5, * r6;
    int r8, sl;
    int g2;

    r8 = buf[0] / 2;
    sl = 0x78;

    r6 = buf + 2;
    r5 = (void *)BG_VRAM + a * 0xA000;

    if (g == 0)
        return;

    if (h == 0)
        return;

    if (g == -1)
    {
        asm("" ::: "memory");
        g = buf[0];
        h = buf[1];
    }

    c >>= 1;
    do e >>= 1; while (0); // by me
    g >>= 1;
    g <<= 1;
    g2 = g; // by permuter
    r6 = r6 + r8 * f + e;
    r5 = r5 + sl * d + c;

    for (i = 0; i < h; i++)
    {
        CpuCopy16(r6, r5, g2);
        r6 = r6 + r8;
        r5 = r5 + sl;
    }
}

void Mode4FillRect(int a, int b, int c, int d, int e, u16 f) 
{
    int i, r8 = 0x78;
    u16 * r5 = (void *)BG_VRAM + a * 0xA000;

    if (d == 0)
        return;

    if (e == 0)
        return;

    b = b >> 1;

    d = d >> 1;
    d = d << 1;

    r5 = r5 + r8 * c + b;

    for (i = 0; i < e; i++)
    {
        CpuFill16(f, r5, d);
        r5 = r5 + r8;
    }
}

void SetBlankBgColor(int r, int g, int b)
{
    r = r & 0x1F;
    g = g & 0x1F;
    b = b & 0x1F;

    gPaletteBuffer[0] = ((b << 10) + (g << 5)) + r;
    EnablePaletteSync();
}
