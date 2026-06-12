#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "ap.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void ManimLevelUp_DimBgm(struct ManimLevelUpProc * proc)
{
    StartBgmVolumeChange(0x100, 0x80, 0x10, proc);
}
