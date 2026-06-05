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









CONST_DATA struct SaveBlocks *gSram = CART_SRAM;



int IsGamePlayedThrough(void)
{
    struct GlobalSaveInfo tmp_header;

    if (!ReadGlobalSaveInfo(&tmp_header))
        return 0;

    if (0 == tmp_header.completed )
        return 0;
    else
        return 1;
}

bool LoadAndVerfyRankData(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == _buf)
        _buf = (void*)gGenericBuffer;

    ReadSramFast(
        &gSram->gameRankSave,
        (void*)_buf,
        sizeof(struct GameRankSaveDataPacks)
    );

    if (_buf->magic0 != Checksum16((void*)_buf, 0x90))
        return 0;
    else
        return 1;
}

bool LoadBonusContentData(void * buf)
{
    struct BonusClaimSaveData * _buf = buf;
    
    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = (void*)gGenericBuffer;

    ReadSramFast(
        &gSram->bonusClaim,
        (void *)_buf,
        sizeof(gSram->bonusClaim)
    );

    if (_buf->cksum16 != Checksum16(_buf, sizeof(_buf->bonus)))
        return 0;
    else
        return 1;
}

void SaveBonusContentData(void * buf)
{
    struct BonusClaimSaveData * _buf = buf;
    _buf->cksum16 = Checksum16(_buf, sizeof(_buf->bonus));
    WriteAndVerifySramFast(buf, &gSram->bonusClaim, sizeof(gSram->bonusClaim));
}

void SaveRankings(void * buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    _buf->magic0 = Checksum16(buf, 0x90);

    WriteAndVerifySramFast(
        buf,
        &gSram->gameRankSave,
        sizeof(struct GameRankSaveDataPacks)
    );
}

void EraseSaveRankData()
{
    u16 _buf[sizeof(struct GameRankSaveDataPacks) / 2];

    CpuFill16(0, _buf, sizeof(struct GameRankSaveDataPacks));
    SaveRankings(_buf);
}

int GetNextChapterMode()
{
    return gPlaySt.chapterModeIndex - 1;
}

int GetSavedRankData(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src;
    struct GameRankSaveData *dest = buf;

    CpuFill16(0, buf, 0x18);
    CpuFill16(0, &_buf, sizeof(_buf));

    if (0 != LoadAndVerfyRankData(&_buf)) {
        src = &_buf.pack[(chapter_mode + difficulty * 3)];
        *dest = *src;
        return 1;
    }
    
    return 0;
}
