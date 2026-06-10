#include "global.h"
#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"

extern const u8 sClassReelClassSetLut[];
extern struct ClassReelEnt* gClassReelOrderedLut[];

struct ClassReelEnt* GetClassReelEntry(int classSet, int index) {
    return gClassReelOrderedLut[sClassReelClassSetLut[classSet] + index];
}
