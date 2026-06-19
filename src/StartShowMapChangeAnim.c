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
extern struct ProcCmd  ProcScr_ShowMapChangeAnim[];

void StartShowMapChangeAnim(ProcPtr parent, int unused, int trapid)
{
    struct ShowMapChangeProc * proc;
    struct Trap * trap;

    proc = Proc_StartBlocking(ProcScr_ShowMapChangeAnim, parent);

    trap = GetTrap(trapid);
    trap->extra ^= 1;

    if (trap->extra != 0)
        proc->mcId = trap->yPos;
    else
        proc->mcId = trap->xPos;

    proc->altSong = trap->extra;
}
