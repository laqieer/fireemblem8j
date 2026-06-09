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
int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo *buf);
int IsGamePlayedThrough(void);

bool IsExtraSupportViewerEnabled()
{
    int tmp0 = GGM_IsAnyCharacterKnown(NULL);
    int tmp1 = IsGamePlayedThrough();
    return tmp1 & tmp0;
}
