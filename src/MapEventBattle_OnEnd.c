#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bm.h"
#include "mapanim.h"

void MapEventBattle_OnEnd(void)
{
    ResetMuAnims();
    ResetTextFont();
    EndMapAnimInfoWindow();
    InitBmBgLayers();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();
}
