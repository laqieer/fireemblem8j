#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

/**
 * Generate random monsters on the worldmap
 */

extern const u8 gWMMonsterSpawnLocations[WM_MON_LOC_MAX];



/* prototypes for same-file helpers called by this run */
int GetWmMonsterGenAmount(int idx);
int GenerateRandomonsterMergeNode(const u8 * lut, int idx);

int GenerateRandomonsterMergeConf(int chapter, struct GmapTimeMonsConf * out)
{
    int r0, cnt, rn;
#ifdef NONMATCHING
    int node;
    u16 * ptr;
    u8 * zeromus;
#else
    register int node asm("r5");
    register u16 * ptr asm("r5");
    register u8 * zeromus asm("r0");
#endif
    int i;
    u32 idx;
    u8 array[WM_MON_LOC_MAX];
    u8 list[WM_MONS_AMT];
    u16 seeds[WM_MONS_AMT];
    const u8 * lut1;

    if (chapter >= 0)
    {
        if (chapter < 10 || chapter == 0x38)
            return 0;

        if (chapter < 0)
            goto handle_xmap;

        switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            for (idx = 0; idx < 11; ++idx)
            {
                if (WmMonsterGenerateRatesIdx_EirikaMode[idx] == chapter)
                    break;
            }
            lut1 = WmMonsterGenerateRates_EirikaMode + idx * WM_MON_LOC_MAX;
            break;

        case CHAPTER_MODE_EPHRAIM:
            for (idx = 0; idx < 11; ++idx) {
                if (WmMonsterGenerateRatesIdx_EphraimMode[idx] == chapter)
                    break;
            }
            lut1 = WmMonsterGenerateRates_EphraimMode + idx * WM_MON_LOC_MAX;
            break;
        }
        cnt = GetWmMonsterGenAmount(idx);
        if (cnt <= 0)
            return 0;
    }
    else
    {
    /* xmap? */
    handle_xmap:

        switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            lut1 = WmMonsterGenerateRates_XmapEirika;
            break;

        case CHAPTER_MODE_EPHRAIM:
            lut1 = WmMonsterGenerateRates_XmapEphraim;
            break;
        }
        cnt = 3;
    }

    memcpy(array, lut1, sizeof(array));
    for (i = 0; i < (u32)WM_MON_LOC_MAX; i++)
    {
        /* Monster will not generate at unit location */
        if (gWMMonsterSpawnLocations[i] == gGMData.units[0].location)
            array[i] = 0;
    }
    StoreRNState(seeds);
    ptr = gGmMonsterRnState;
    LoadRNState(ptr);

    for (i = 0; i < cnt; i++)
    {
        node = GenerateRandomonsterMergeNode(array, WM_MON_LOC_MAX);
        if (node < 0)
            return i;
        out[i].node = gWMMonsterSpawnLocations[node];
        GetChapterSkirmishLeaderClasses(WMLoc_GetChapterId(out[i].node), list);
        rn = NextRN_N(sizeof(list));
        out[i].jid = list[rn];
        out[i].unk2 = 0;
        gGMData.unk_c9[i] = rn;
        zeromus = array + node;
        *zeromus = 0;
    }
    StoreRNState(gGmMonsterRnState);
    LoadRNState(seeds);
    return cnt;
}
