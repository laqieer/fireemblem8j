#include "global.h"
#include "worldmap.h"

//! FE8U = 0x080C0960
int IsChapterMonsterSpawnActive(int chIndex)
{
    int nodeId = GetPlayChapterId(chIndex);

    if ((gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) || (GetNextUnclearedNode(&gGMData) != nodeId))
    {
        int i;

        for (i = 0; i < gWMMonsterSpawnsSize; i++)
        {
            if (nodeId == gWMMonsterSpawnLocations[i])
            {
                return 1;
            }
        }
    }

    return 0;
}
