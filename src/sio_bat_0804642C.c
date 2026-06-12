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

/* prototypes for same-file helpers called by this run */
void SioBat_PrepareTeamUnit(struct Unit * unit);

//! FE8U = 0x080464B0
void SioBat_InitTeamTransfer(struct SioBatProc * proc)
{
    int i;

    int base = gSioSt->selfId * 0x40 + 1;
    gUnk_Sio_13 = 0;

    InitUnits();
    ReadMultiArenaSaveTeamRaw(gLinkArenaSt.unk_03, gSioPostbattle_3);

    for (i = 0; i < 5; i++)
    {
        struct Unit * unit = GetUnit(base + i);

        ClearUnit(unit);
        LoadSavedUnit(&gSioPostbattle_3->units[i], unit);

        SioBat_PrepareTeamUnit(unit);

        unit->index = base + i;

        if (i == 0)
        {
            gUnk_Sio_16.unk_24[gSioSt->selfId] = GetUnitMiniPortraitId(unit);
        }
    }

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.linking_status[i] = 0;
    }

    gSioSt->unk_00A = 1 << gSioSt->selfId;

    proc->unk_64 = 0;
    proc->unk_4c = 0;

    return;
}
