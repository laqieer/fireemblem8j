#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"

void PrepItemSupply_DrawConvoyHeader(void);

void PrepItemSupply_RedrawConvoyHeaderWorker(void)
{
    PrepItemSupply_DrawConvoyHeader();
    return;
}
