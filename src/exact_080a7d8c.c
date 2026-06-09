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
int IsGamePlayedThrough(void);
bool LoadAndVerfyRankData(void *buf);

u32 GetRankDataValidBitMap(void)
{
    struct GameRankSaveDataPacks buf;
    u32 attr = 0;
    u8 ret = IsGamePlayedThrough();
    if (!ret)
        return 0;

    if (LoadAndVerfyRankData(&buf)) {
        if (buf.pack[0].valid)
            attr  = 1 << 0x0;
    
        if (buf.pack[1].valid)
            attr |= 1 << 0x1;
    
        if (buf.pack[2].valid)
            attr |= 1 << 0x2;
    
        if (buf.pack[3].valid)
            attr |= 1 << 0x3;
    
        if (buf.pack[4].valid)
            attr |= 1 << 0x4;
    
        if (buf.pack[5].valid)
            attr |= 1 << 0x5;
    }
    return attr;
}
