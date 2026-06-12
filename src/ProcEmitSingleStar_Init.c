#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "ctc.h"
#include "bmfx.h"
#include "bmlib.h"

/**
 * Some effect proc emitting little white stars. Seems unused
 */

struct ProcEmitSingleStarFx {
    PROC_HEADER;

    /* 2C */ int loc_x;
    /* 30 */ int loc_y;
    /* 34 */ int xdiff_cur;
    /* 38 */ int ydiff_cur;
    /* 3C */ int xdiff_const;
    /* 40 */ int ydiff_const;
};
struct ProcEmitStars {
    PROC_HEADER;

    /* 44 */ u8 _pad_29[0x34 - 0x29];

    /* 34 */ int xloc;
    /* 38 */ int yloc;
    /* 3C */ int xdiff_const;
    /* 40 */ int ydiff_const;

    /* 44 */ u8 _pad_44[0x4C - 0x44];

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 stars;
    /* 66 */ s16 star_cannot_move;
};

/* section.text */

void ProcEmitSingleStar_Init(struct ProcEmitSingleStarFx *proc)
{
    int ydiff, ydiff_tmp;

    proc->xdiff_cur = 0;
    proc->ydiff_cur = 0;
    proc->xdiff_const = 0;
    
    ydiff_tmp = AdvanceGetLCGRNValue() % 0x400;
    ydiff = ydiff_tmp + 0xC00 + ((struct ProcEmitStars*)proc->proc_parent)->stars * 0x10;

    proc->ydiff_const = -ydiff;
}
