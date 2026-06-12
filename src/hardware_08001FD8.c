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

struct Struct02024CD4 EWRAM_DATA gFrameTmRegisterConfig = { 0 };
struct TileDataTransfer EWRAM_DATA gFrameTmRegister[32] = { 0 };

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
void ClearTileRigistry(void);

void FlushTiles(void)
{
    struct TileDataTransfer *ptr = gFrameTmRegister;
    int i;

    for (i = 0; i < gFrameTmRegisterConfig.count; i++)
    {
        switch (ptr->mode)
        {
        case 0:
            CpuCopy16(ptr->src, ptr->dest, ptr->size);
            break;
        case 1:
            CpuFastCopy(ptr->src, ptr->dest, ptr->size);
            break;
        case 2:
            CpuFastFill((u32)ptr->src, ptr->dest, ptr->size);
            break;
        }
        ptr++;
    }
    ClearTileRigistry();
}
