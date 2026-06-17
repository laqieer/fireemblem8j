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



bool LoadBonusContentData(void * buf);

void EraseSramDataIfInvalid()
{
    if (!ReadGlobalSaveInfo(NULL))
        InitGlobalSaveInfodata();

    if (!LoadBonusContentData(NULL))
        EraseBonusContentData();
    
    if (!LoadAndVerfyRankData(NULL))
        EraseSaveRankData();
    
    if (!LoadAndVerifySoundRoomData(NULL))
        EraseSoundRoomSaveData();
    
    if (!LoadAndVerfyLinkArenaStruct2(NULL))
        EraseLinkArenaStruct2();
    
    LoadAndVerfySuspendSave();
}
