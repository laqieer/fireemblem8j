#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);













/* prototypes for same-file helpers called by this run */
int GetNextChapterMode();
int GetSavedRankData(void *buf, int chapter_mode, int difficulty);
void SaveNewRankData(void *buf, int chapter_mode, int difficulty);
u8 JudgeGameRankSaveData(struct GameRankSaveData *old, struct GameRankSaveData *new);
void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty);

void SaveEndgameRankings()
{
    struct GameRankSaveData old, new;

    int chapter_mode = GetNextChapterMode();
    int difficult = 1 & gPlaySt.chapterStateBits >> 6;

    GenerateGameRankSaveData(&new, chapter_mode, difficult);
    GetSavedRankData(&old, chapter_mode, difficult);

    if (0 != JudgeGameRankSaveData(&old, &new))
        SaveNewRankData(&new, chapter_mode, difficult);
}
