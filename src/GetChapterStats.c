#include "global.h"
#include "bmsave.h"

struct ChapterStats *GetChapterStats(int index)
{
    return &gChapterStats[index];
}
