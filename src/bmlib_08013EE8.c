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

void FadeOutBlackSpeed04(ProcPtr parent)
{
    StartFadeCore(1, 0x04, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed08(ProcPtr parent)
{
    StartFadeCore(1, 0x08, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed10(ProcPtr parent)
{
    StartFadeCore(1, 0x10, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed20(ProcPtr parent)
{
    StartFadeCore(1, 0x20, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed40(ProcPtr parent)
{
    StartFadeCore(1, 0x40, parent, ForceScreenToBlack);
}
