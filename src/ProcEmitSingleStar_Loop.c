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

void ProcEmitSingleStar_Loop(struct ProcEmitSingleStarFx *proc)
{
    int xdiff, ydiff;

    struct ProcEmitStars *parent = proc->proc_parent;
    if (0 == parent->star_cannot_move || 0 == GetGameClock() % 4) {
        xdiff = proc->xdiff_cur + proc->xdiff_const;
        proc->xdiff_cur = xdiff;

        ydiff = proc->ydiff_cur + proc->ydiff_const;
        proc->ydiff_cur = ydiff;
        proc->loc_x += xdiff;
        proc->loc_y += ydiff;
    }

    if (proc->loc_y < 0) {
        Proc_Break(proc);
        ((struct ProcEmitStars*)proc->proc_parent)->counter--;
    } else {
        PutSprite(0xA,
                proc->loc_x >> 0x10,
                proc->loc_y >> 0x10,
                gObject_8x8,
                OAM2_PAL(0) + OAM2_LAYER(2) + OAM2_CHR(OBJCHR_EMITSTARTS));
    }
}
