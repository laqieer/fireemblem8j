#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent);
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent);

// clang-format on

//! FE8U = 0x0804CAEC
ProcPtr StartSioTeamMenuSpriteDraw(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf)
{
    struct SioProc85AAA78 * proc;
    int i;

    Proc_EndEach(ProcScr_SioUiutils_0);
    proc = Proc_Start(ProcScr_SioUiutils_0, parent);

    proc->unk_2c = numActiveOptions;
    proc->unk_44 = 1;
    proc->unk_40 = 0;
    proc->unk_48 = -1;

    for (i = 0; i < 5; i++)
    {
        proc->unk_3a[i] = buf[i];
        proc->unk_30[i] = -8;
    }

    StartLinkArenaMenuScrollBar(225, 40, parent->unk_38, 6, parent->yBg1 + 40, proc);
    PutLinkArenaTeamSprites(152, 40 - parent->unk_48 * 16, 136, 39, parent->unk_38, proc);

    return proc;
}
