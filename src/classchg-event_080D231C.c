#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

void RefreshBMapDisplay_FromPromotion(void)
{
    BMapDispResume();
    RefreshBMapGraphics();
    RefreshEntityBmMaps();
    EndAllMus();
    StartMu(gActiveUnit);
    RenderBmMap();
    RefreshUnitSprites();
}
