#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"
#include "constants/songs.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void PutLinkArenaButtonSpriteAt(int x, int y);

//! FE8U = 0x0804C2DC
void LAButtonSprites_Loop(struct SioProc85AA954 * proc)
{
    PutLinkArenaButtonSpriteAt(proc->x, proc->y);
    return;
}
