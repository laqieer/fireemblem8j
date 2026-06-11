#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

void WriteChapterFlags(void *sram_dest)
{
    WriteAndVerifySramFast(
        GetChapterFlagBits(),
        sram_dest,
        GetChapterFlagBitsSize());
}
