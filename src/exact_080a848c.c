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
bool LoadAndVerfyRankData(void *buf);
void SaveRankings(void * buf);

void SaveNewRankData(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src = buf;

    if (0 != LoadAndVerfyRankData(&_buf)) {
        _buf.pack[chapter_mode + difficulty * 3] = *src;
        SaveRankings(&_buf);
    }
}
