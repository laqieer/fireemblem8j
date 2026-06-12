#include "global.h"

#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"

#include "sio.h"
#include "sio_core.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08046478
void SioBat_PrepareTeamUnit(struct Unit * unit)
{
    unit->exp = 0;
    SetUnitStatus(unit, 0);
    unit->rescue = 0;

    if (gLinkArenaSt.unk_ec.unk_0_2 == 0)
    {
        GiveUnitDefaultWeapons(unit);
    }
    else
    {
        SetUnitAllItemsUsesToMax(unit);
    }

    return;
}
