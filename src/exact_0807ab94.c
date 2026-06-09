#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"




































































/* prototypes for same-file helpers called by this run */
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);
void PlayMuStepSe(struct MuProc * proc);

bool IsMuActive(struct MuProc * mu)
{
    if (mu->config->slot && mu->state != MU_STATE_INACTIVE)
        return true;

    return false;
}

void SetMuMoveScript(struct MuProc * mu, const u8 commands[MOVE_CMD_MAX_COUNT])
{
    int i;

    for (i = 0; i < 0x40; ++i)
        mu->config->movescr[i] = commands[i];

    mu->config->pc = 0;
    mu->state = MU_STATE_MOVEMENT;

    PlayMuStepSe(mu);
}

struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int pal, const u8 commands[MOVE_CMD_MAX_COUNT])
{
    struct MuProc * proc = StartMuInternal(x, y, jid, -1, pal);
    if (!proc)
        return NULL;

    SetMuMoveScript(proc, commands);
    return proc;
}
