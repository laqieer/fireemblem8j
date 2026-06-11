#include "global.h"
#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

void PopulateSaveBlockChecksum(struct SaveBlockInfo* buf)
{
    int size = buf->size;
    void *sram_dest = SramOffsetToAddr(buf->offset);
    buf->checksum32 = SramChecksum32(sram_dest, size);
}
