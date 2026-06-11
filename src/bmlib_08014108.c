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

void FadeOutWhiteSpeed08Locking(ProcPtr parent)
{
    StartFadeCore(7, 0x08, parent, ForceScreenToWhite);
}
