#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"



extern u16 EWRAM_DATA gPaletteBuffer[0x200];
extern u16 EWRAM_DATA gBG0TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG1TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG2TilemapBuffer[32 * 32];
extern u16 EWRAM_DATA gBG3TilemapBuffer[32 * 32];



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
int GetBackgroundTileDataOffset(int bg);
void SetBackgroundTileDataOffset(int bg, int offset);
void SetBackgroundMapDataOffset(int bg, int offset);
void SetBackgroundScreenSize(int bg, int size);
void BG_Fill(void *dest, int b);
void BG_SetPosition(u16 bg, u16 x, u16 y);
u16* BG_GetMapBuffer(int bg);
void InitOam(int loSz);

void SetupBackgrounds(u16 *bgConfig)
{
    u16 defaultBgConfig[12] =
    {
        // tile offset  map offset  screen size
        0x0000,         0x6000,     0,          // BG 0
        0x0000,         0x6800,     0,          // BG 1
        0x0000,         0x7000,     0,          // BG 2
        0x8000,         0x7800,     0,          // BG 3
    };
    int bg;

    if (bgConfig == NULL)
        bgConfig = defaultBgConfig;

    *(u16 *)&gLCDControlBuffer.bg0cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg1cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg2cnt = 0;
    *(u16 *)&gLCDControlBuffer.bg3cnt = 0;

    for (bg = 0; bg <= 3; bg++)
    {
        SetBackgroundTileDataOffset(bg, *bgConfig++);
        SetBackgroundMapDataOffset(bg, *bgConfig++);
        SetBackgroundScreenSize(bg, *bgConfig++);
        BG_SetPosition(bg, 0, 0);
        BG_Fill(BG_GetMapBuffer(bg), 0);
        CpuFastFill16(0, (void *)(VRAM + GetBackgroundTileDataOffset(bg)), 64);
    }
    InitBmBgLayers();
    sModifiedBGs |= 0xF;

    InitOam(0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    sModifiedPalette = 1;

    gLCDControlBuffer.dispcnt.forcedBlank = 0;
    gLCDControlBuffer.dispcnt.mode = 0;
    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;
}
