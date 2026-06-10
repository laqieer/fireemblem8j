#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void FlushLCDControl(void)
{
    // NOTE: most of these break strict aliasing rules.
    // this function needs to be rewritten to be acceptable for modern compiler.

    #define COPY_REG(type, reg, src) *(type *)REG_ADDR_##reg = *(type *)src;

    COPY_REG(u16, DISPCNT, &gLCDControlBuffer.dispcnt)
    COPY_REG(u16, DISPSTAT, &gLCDControlBuffer.dispstat)

    COPY_REG(u16, BG0CNT, &gLCDControlBuffer.bg0cnt)
    COPY_REG(u16, BG1CNT, &gLCDControlBuffer.bg1cnt)
    COPY_REG(u16, BG2CNT, &gLCDControlBuffer.bg2cnt)
    COPY_REG(u16, BG3CNT, &gLCDControlBuffer.bg3cnt)

    // set both HOFS and VOFS with a single 32-bit copy
    COPY_REG(u32, BG0HOFS, &gLCDControlBuffer.bgoffset[0])
    COPY_REG(u32, BG1HOFS, &gLCDControlBuffer.bgoffset[1])
    COPY_REG(u32, BG2HOFS, &gLCDControlBuffer.bgoffset[2])
    COPY_REG(u32, BG3HOFS, &gLCDControlBuffer.bgoffset[3])

    // set both WIN0H and WIN1H with a single 32-bit copy
    COPY_REG(u32, WIN0H, &gLCDControlBuffer.win0_right)
    // set both WIN0V and WIN1V with a single 32-bit copy
    COPY_REG(u32, WIN0V, &gLCDControlBuffer.win0_bottom)
    // set both WININ and WINOUT with a single 32-bit copy
    COPY_REG(u32, WININ, &gLCDControlBuffer.wincnt)

    COPY_REG(u16, MOSAIC, &gLCDControlBuffer.mosaic)
    COPY_REG(u16, BLDCNT, &gLCDControlBuffer.bldcnt)
    COPY_REG(u16, BLDALPHA, &gLCDControlBuffer.blendCoeffA)
    COPY_REG(u8, BLDY, &gLCDControlBuffer.blendY)

    // set both BG2PA and BG2PB with a single 32-bit copy
    COPY_REG(u32, BG2PA, &gLCDControlBuffer.bg2affin.pa)
    // set both BG2PC and BG2PD with a single 32-bit copy
    COPY_REG(u32, BG2PC, &gLCDControlBuffer.bg2affin.pc)
    COPY_REG(u32, BG2X, &gLCDControlBuffer.bg2affin.dx)
    COPY_REG(u32, BG2Y, &gLCDControlBuffer.bg2affin.dy)

    // set both BG3PA and BG3PB with a single 32-bit copy
    COPY_REG(u32, BG3PA, &gLCDControlBuffer.bg3affin.pa)
    // set both BG3PC and BG3PD with a single 32-bit copy
    COPY_REG(u32, BG3PC, &gLCDControlBuffer.bg3affin.pc)
    COPY_REG(u32, BG3X, &gLCDControlBuffer.bg3affin.dx)
    COPY_REG(u32, BG3Y, &gLCDControlBuffer.bg3affin.dy)

    #undef COPY_REG
}
