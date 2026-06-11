#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

extern s8 EWRAM_DATA gFadeComponentStep[0x20];
extern s8 EWRAM_DATA gFadeComponents[0x600];
extern u16 EWRAM_DATA gPaletteBuffer[0x200];
extern u16 EWRAM_DATA gBG0TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG1TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG2TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG3TilemapBuffer[32 * 32];

extern void * EWRAM_DATA gBGVramTilemapPointers[4];

extern void (* EWRAM_DATA gMainCallback)(void);




extern struct KeyStatusBuffer * CONST_DATA gKeyStatusPtr;




struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

/* file-scope type definitions used by this run */


struct UnknownDmaStruct
{
    u16 unk00;  // u32? Why do these overlap?
    u8 unk02[1];
};

struct UnknownDmaStruct2
{
    int attr01;
    u16 attr2;
    s16 x;
    s16 y;
};

/* prototypes for same-file helpers called by this run */
struct BgCnt *BG_GetControlBuffer(u16 bg);
void RegisterFillTile(const void *src, void *dst, int size);

void BG_SetColorBpp(int bg, int bitsPerPixel)
{
    BG_GetControlBuffer(bg)->colorMode = (bitsPerPixel == 8) ? 1 : 0;
}

static void ApplyColorAddition_ClampMax(int a)
{
    int i;
    u16 *src = gPaletteBuffer;
    u16 *dest = (u16 *)PLTT;

    for (i = 0; i < 0x200; i++)
    {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r > 31)
            r = 31;
        if (g > 31)
            g = 31;
        if (b > 31)
            b = 31;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

static void ApplyColorAddition_ClampMin(int a)
{
    int i;
    u16 *src = gPaletteBuffer;
    u16 *dest = (u16 *)PLTT;

    for (i = 0; i < 0x200; i++)
    {
        int r = RED_VALUE(*src) + a;
        int g = GREEN_VALUE(*src) + a;
        int b = BLUE_VALUE(*src) + a;

        if (r < 0)
            r = 0;
        if (g < 0)
            g = 0;
        if (b < 0)
            b = 0;

        *dest = (b << 10) + (g << 5) + r;

        src++;
        dest++;
    }
}

void FlushBackgrounds(void)
{
    if (sModifiedBGs & (1 << 0))
        CpuFastCopy(gBG0TilemapBuffer, gBGVramTilemapPointers[0], 0x800);
    if (sModifiedBGs & (1 << 1))
        CpuFastCopy(gBG1TilemapBuffer, gBGVramTilemapPointers[1], 0x800);
    if (sModifiedBGs & (1 << 2))
        CpuFastCopy(gBG2TilemapBuffer, gBGVramTilemapPointers[2], 0x800);
    if (sModifiedBGs & (1 << 3))
        CpuFastCopy(gBG3TilemapBuffer, gBGVramTilemapPointers[3], 0x800);
    sModifiedBGs = 0;

    if (sModifiedPalette == 1)
    {
        sModifiedPalette = 0;
        if (gLCDControlBuffer.colorAddition == 0)
            CpuFastCopy(gPaletteBuffer, (void *)PLTT, 0x400);
        else if (gLCDControlBuffer.colorAddition > 0)
            ApplyColorAddition_ClampMax(gLCDControlBuffer.colorAddition);
        else
            ApplyColorAddition_ClampMin(gLCDControlBuffer.colorAddition);
    }
}

void BG_Fill(void *dest, int b)
{
    CpuFastFill(b * 0x10001, dest, 0x800);
}

void RegisterBlankTile(int a)
{
    RegisterFillTile(NULL, (void *)(VRAM + a * 32), 32);
}

void SetInterrupt_LCDVBlank(InterruptHandler handler)
{
    if (handler != NULL)
    {
        gLCDControlBuffer.dispstat.vblankIrqEnable = 1;
        SetIRQHandler(0, handler);
        REG_IE |= INTR_FLAG_VBLANK;
    }
    else
    {
        gLCDControlBuffer.dispstat.vblankIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_VBLANK;
    }
}

void SetInterrupt_LCDVCountMatch(InterruptHandler handler)
{
    if (handler != NULL)
    {
        gLCDControlBuffer.dispstat.vcountIrqEnable = 1;
        SetIRQHandler(2, handler);
        REG_IE |= INTR_FLAG_VCOUNT;
    }
    else
    {
        gLCDControlBuffer.dispstat.vcountIrqEnable = 0;
        REG_IE &= ~INTR_FLAG_VCOUNT;
        gLCDControlBuffer.dispstat.vcountCompare = 0;
    }
}

void SetNextVCount(int a)
{
    u16 dispstat = *(u8 *)&REG_DISPSTAT | (a << 8);
    REG_DISPSTAT = dispstat;
}

void SetLCDVCountSetting(int set)
{
    gLCDControlBuffer.dispstat.vcountCompare = set;
}
