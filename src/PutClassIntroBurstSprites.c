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
/* TU-private data externs bound at their JP addresses */
extern u16 sSprite_Opinfo_13[];

void PutClassIntroBurstSprites(struct OpInfoBurstProc* proc, int b, int c, int d) {

    int x = Interpolate(5, 0x78, c, proc->unk_4c, 0x46);
    int y = Interpolate(5, 0x50, d, proc->unk_4c, 0x46);

    PutSpriteExt(4, ((x - 8) & 0x1FF) | (b << 9), ((y - 8) & 0x1FF) | 0x100, sSprite_Opinfo_13, 0xF000);

    PutSpriteExt(4, ((0xE8 - x) & 0x1FF) | (b << 9), ((0x98 - y) & 0x1FF) | 0x100, sSprite_Opinfo_13, 0xF000);

    return;
}
