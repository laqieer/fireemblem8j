#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct GuideSt * gGuideSt;

//! FE8U = 0x080CEAE8
void BuildGuideTopicList(void)
{
    int i;
    u8 local[20];
    int r3;
    int r4;

    for (i = 0; i < 20; i++)
    {
        local[i] = 0;
        gGuideSt->unk_54[i] = 0;
    }

    i = 0;
    r4 = gGuideTable[i].title;

    while (gGuideTable[i].title != 0xc)
    {
        if (CheckFlag(gGuideTable[i].displayFlag))
        {
            local[r4] = r4;
        }

        i++;
        r4 = gGuideTable[i].title;
    }

    gGuideSt->unk_3d = 0;

    for (i = 0; i < 0xc; i++)
    {
        int tmp2;

        r4 = local[i];
        if (r4 == 0)
        {
            continue;
        }

        if (gGuideSt->unk_3d == 0)
        {
            gGuideSt->unk_54[0] = r4;
            gGuideSt->unk_3d++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gGuideSt->unk_3d) && (gGuideSt->unk_54[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gGuideSt->unk_54[gGuideSt->unk_3d] = r4;
            gGuideSt->unk_3d++;
        }
    }

    return;
}
