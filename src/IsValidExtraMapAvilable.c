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

bool IsValidExtraMapAvilable(void)
{
    struct GlobalSaveInfo buf;

    if (!ReadGlobalSaveInfo(&buf))
        return false;

    if (!IsExtraMapAvailable())
        return false;
    else
        return true;
}
