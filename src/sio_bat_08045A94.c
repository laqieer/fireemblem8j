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

//! FE8U = 0x08045AF4
void SioBat_LoadAllTeamUnits(void)
{
    int i;
    int j;

    // TODO: rodata
    u8 hack[3];
    memcpy(hack, gSioPostbattle_1, sizeof(gSioPostbattle_1));

    InitUnits();

    for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
    {
        int r4 = i * 0x40 + 1;

        struct Unit * unit = GetUnit(r4);
        ReadMultiArenaSaveTeam(gLinkArenaSt.unk_06[i], unit, gUnk_Sio_9[i]);

        gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05;

        for (j = 0; j < 5; j++)
        {
            u16 * fid = gUnk_Sio_16.unk_24 - -i;

            unit = GetUnit(r4 + j);

            unit->exp = 0;
            SetUnitStatus(unit, 0);
            unit->rescue = 0;

            if ((gSioSaveConfig._unk2_) == 0)
            {
                GiveUnitDefaultWeapons(unit);
            }
            else
            {
                SetUnitAllItemsUsesToMax(unit);
            }

            if (j == 0)
            {
                *fid = GetUnitMiniPortraitId(unit);
            }

            unit->index = r4 + j;

            if (i == 0)
            {
                continue;
            }

            if (gSioSaveConfig._unk0_ == 0)
            {
                unit->state = US_BIT9;
            }
        }
    }

    gUnk_Sio_16.unk_00 = 0;

    gSioSt->selfId = 0;
    gSioSt->unk_009 = hack[gLinkArenaSt.unk_05];
    gSioSt->unk_007 = gLinkArenaSt.unk_05 + 2;

    gLinkArenaSt.unk_A0 = gLinkArenaSt.unk_05 + 2;

    return;
}
