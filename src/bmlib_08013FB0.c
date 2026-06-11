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

void FadeOutBlackSpeed04Locking(ProcPtr parent)
{
    StartFadeCore(3, 0x04, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed08Locking(ProcPtr parent)
{
    StartFadeCore(3, 0x08, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed10Locking(ProcPtr parent)
{
    StartFadeCore(3, 0x10, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed20Locking(ProcPtr parent)
{
    StartFadeCore(3, 0x20, parent, ForceScreenToBlack);
}

void FadeOutBlackSpeed40Locking(ProcPtr parent)
{
    StartFadeCore(3, 0x40, parent, ForceScreenToBlack);
}
