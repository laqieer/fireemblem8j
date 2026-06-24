#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"

#include "constants/chapters.h"
#include "constants/worldmap.h"

#include "worldmap.h"
#include "constants/songs.h"

void GmBuildSkirmishNodeList(struct Unknown0201B100 * buf);
int GmFindPathRecursive(struct Unknown0201B0D8 * buf, struct GMapNodeLink * links, s8 param_3, s8 param_4, s8 param_5, int param_6);
int GmFindPathThroughBlockedRecursive(struct Unknown0201B0D8 * buf, struct GMapNodeLink * param_2, s8 param_3, s8 param_4, s8 param_5, int param_6, int param_7);

//! FE8U = 0x080BCCFC
s8 GmFindPath(s8 a, s8 b, s8 flag)
{
    int ret;
    int r4;
    struct Unknown0201B0D8 * r6;

    GmBuildSkirmishNodeList(gUnk_12);

    if (flag != 0)
    {
        gUnk_11.unk_24 = 0x10;
    }

    r6 = &gUnk_11;
    r6->unk_20 = 0x10;

    CpuFill32(0, r6->unk_00, 0x10);
    CpuFill32(0, r6->unk_10, 0x10);

    r6->unk_00[0] = a;
    r6->unk_10[0] = a;

    if (flag != 0)
    {
        ret = GmFindPathThroughBlockedRecursive(r6, gUnk_10, -1, a, b, r4 = 1, -1);
    }
    else
    {
        ret = GmFindPathRecursive(r6, gUnk_10, -1, a, b, r4 = 1);
    }

    if (ret != 0)
    {
        r6->unk_00[1] = r6->unk_10[1];
        r6->unk_20 = r4;

        return 1;
    }

    return gUnk_11.unk_20 < 0x10;
}
