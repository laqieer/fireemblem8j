#include "global.h"
#include "bmsave.h"
#include "bmlib.h"
#include "face.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmio.h"
#include "uiutils.h"
#include "sio_core.h"
#include "sio.h"
#include "bmdebug.h"

void SioMenu_End(struct SioMenuProc * proc)
{
    int i;

    struct ProcCmd * SioMenuProcLut[5] = {
        ProcScr_SIOTERM, // Edit Teams
        ProcScr_SIOPRA, // Practice
        ProcScr_SIOBAT, // Linked Battle
        ProcScr_SIORESULT, // Battle Data
        ProcScr_SIO_RuleSettings, // Rule Settings
    };

    EndMuralBackground();
    EndFaceById(3);

    for (i = 0; i < 5; i++)
    {
        Proc_End(proc->menuItems[i]);
    }

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        BMapVSync_End();
        Nop_SioUiutils_0();

        UnsetBmStLinkArenaFlag();

        Proc_EndEach(ProcScr_DebugMonitor);
        Proc_End(proc);
    }
    else
    {
        gLinkArenaSt.unk_01 = gLinkArenaSt.unk_00;
        Proc_StartBlocking(SioMenuProcLut[gLinkArenaSt.unk_00], proc);
    }

    return;
}
