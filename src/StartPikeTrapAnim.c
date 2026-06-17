#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "ap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "bmmap.h"
#include "bm.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "constants/songs.h"


struct TrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x4A - 0x34];
    /* 4A */ s16 direction;
    /* 60 */
};
struct UnkTrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x58 - 0x34];
    /* 58 */ int direction;
    /* 5C */ int timer;
    /* 60 */
};
struct ShowMapChangeProc{
    PROC_HEADER;

    /* 2C */ int mcId;
    /* 30 */ int altSong;
    /* 34 */ int sndx;
};
extern struct ProcCmd  ProcScr_PikeTrapAnim[];

void StartPikeTrapAnim(ProcPtr parent, int x, int y, int facing)
{
    struct TrapfxProc *proc = Proc_StartBlocking(ProcScr_PikeTrapAnim, parent);

    proc->x = x;
    proc->y = y;

    switch (facing)
    {
    case FACING_RIGHT:
        proc->direction = FACING_LEFT;
        break;

    case FACING_LEFT:
        proc->direction = FACING_RIGHT;
        break;

    case FACING_UP:
        proc->direction = FACING_DOWN;
        break;

    default:
        break;
    }
}
