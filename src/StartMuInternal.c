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

struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId)
{
    struct MuConfig * config;
    struct MuProc * proc;
    struct APHandle * ap;

    u8 delay = 0;
    u8 slot = 0;

    if (objTileId == -1)
        config = GetDefaultMuConfig(objTileId = OBCHR_MU_380, &slot);
    else
        config = GetNewMuConfig(objTileId, &slot);

    if (!config)
        return NULL;

    if (Proc_Find(ProcScr_Mu))
        delay = -2;

    proc = Proc_Start(ProcScr_Mu, PROC_TREE_5);

    if (!proc)
        return NULL;

    proc->unit = NULL;
    proc->state = MU_STATE_INACTIVE;
    proc->x_q4 = (x * 16) << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = (y * 16) << MU_SUBPIXEL_PRECISION;
    proc->x_offset_q4 = 0;
    proc->y_offset_q4 = 0;
    proc->facing = MU_FACING_UNK11;
    proc->move_clock_q4 = 0;
    proc->step_sound_clock = delay;
    proc->jid = jid;
    proc->hidden_b = 0;
    proc->pGfxVRAM = OBJ_VRAM0 + (0x20 * objTileId);
    proc->slot = slot;
    proc->layer = OAM2_LAYER(2);
    proc->moveConfig = 0;
    proc->fast_walk_b = false;
    config->pal = palId;

    ap = AP_Create(GetMuAnimForJid(jid), 10);
    AP_SwitchAnimation(ap, MU_FACING_SELECTED);

    Decompress(
        GetMuImg(proc),
        GetMuImgBufById(config->slot)
    );

    ap->pGraphics = GetMuImgBufById(config->slot);
    ap->tileBase = OAM2_PAL(config->pal) + config->chr + proc->layer;

    proc->sprite_anim = ap;
    proc->config = config;
    config->mu = proc;
    return proc;
}
