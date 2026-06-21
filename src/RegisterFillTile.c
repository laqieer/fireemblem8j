#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

//! FE8U = 0x080001FA4
void RegisterFillTile(const void *src, void *dst, int size)
{
    struct TileDataTransfer *ptr = &gFrameTmRegister[gFrameTmRegisterConfig.count];

    ptr->src = src;
    ptr->dest = dst;
    ptr->size = size;
    ptr->mode = 2;
    gFrameTmRegisterConfig.size += size;
    gFrameTmRegisterConfig.count++;
}
