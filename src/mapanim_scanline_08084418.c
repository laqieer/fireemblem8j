#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"


extern EWRAM_DATA u16 * gManimScanlineBufs[2];
extern EWRAM_DATA u16 * gManimActiveScanlineBuf;

/* file-scope type definitions used by this run */


struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

/* prototypes for same-file helpers called by this run */
void SwapScanlineBufs(void);
void PrepareGradientScanlineBuf(u16 * buf, u16 yTop, u16 yBottom, u16 colorA, u16 colorB);

//! FE8U = 0x080820D8
void StartManimFrameGradientScanlineEffect(u16 yTop, u16 yBottom, u16 colorArg3, u16 colorArg4)
{
    // clang-format off
    #define RGB_HALVED(color, component_mask) \
        ((((component_mask) & (color)) >> 1) & (component_mask))
    // clang-format on

    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1], yTop, yBottom, colorArg3,
        RGB_HALVED(colorArg3, 0x1F) | RGB_HALVED(colorArg3, 0x1F << 5) | RGB_HALVED(colorArg3, 0x1F << 10));
    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1] + DISPLAY_HEIGHT, yTop, yBottom, colorArg4,
        RGB_HALVED(colorArg4, 0x1F) | RGB_HALVED(colorArg4, 0x1F << 5) | RGB_HALVED(colorArg4, 0x1F << 10));
    SwapScanlineBufs();

    SetPrimaryHBlankHandler(HBlank_MapAnimGradientColor);

    return;

    // clang-format off
    #undef RGB_HALVED
    // clang-format on
}
