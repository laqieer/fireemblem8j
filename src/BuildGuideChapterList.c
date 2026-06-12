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

//! FE8U = 0x080CEBA4
void BuildGuideChapterList(void)
{
    int i;
    u8 local[20];
    int r3;
    int r4;

    for (i = 0; i < 20; i++)
    {
        local[i] |= 0xff;
        gGuideSt->unk_40[i] = 0;
    }

    i = 0;
    r4 = gGuideTable[i].title;

    while (r4 != 12)
    {
        if (CheckFlag(gGuideTable[i].displayFlag))
        {
            r4 = gGuideTable[i].chapterTitle;
            local[r4] = r4;
        }

        i++;
        r4 = gGuideTable[i].title;
    }

    gGuideSt->unk_3c = 0;

    for (i = 0; i < 12; i++)
    {
        int tmp2;

        if (local[i] == 0xff)
        {
            continue;
        }

        r4 = local[i];

        if (gGuideSt->unk_3c == 0)
        {
            gGuideSt->unk_40[0] = r4;
            gGuideSt->unk_3c++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gGuideSt->unk_3c) && (gGuideSt->unk_40[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gGuideSt->unk_40[gGuideSt->unk_3c] = r4;
            gGuideSt->unk_3c++;
        }
    }

    return;
}
