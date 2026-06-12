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

int GetDataSize(const void* data);

/**
 * This is unused since generic buffer holds only 0x1000 size,
 * which may cause overflow
 */
void DecompressViaGenericBuf(const void *src, void *dst)
{
    LZ77UnCompWram(src, gGenericBuffer);
    CpuFastCopy(gGenericBuffer, dst, GetDataSize(src));
}
