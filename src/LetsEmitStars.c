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
extern struct ProcCmd ProcScr_EmitSingleStar[];
void Calcs_Interpolate(int *buf1, int *buf2, int r2, int r3, int r4);

void LetsEmitStars(struct ProcEmitStars *proc)
{
    int val;
    struct ProcEmitSingleStarFx * child;
    
    if (0 == GetGameClock() % 4)
        return;

    val = 0;
    
    if (proc->counter > 0x28)
        return;

    while (1) {
        child = Proc_Start(ProcScr_EmitSingleStar, proc);
        child->loc_x = (proc->xloc * 0x10000)
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x10;
        child->loc_y = (proc->yloc + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

        Calcs_Interpolate(
            &child->loc_x,
            &child->loc_y,
            proc->xdiff_const,
            proc->ydiff_const,
            proc->stars <= 0x100 ? proc->stars : 0x100
        );

        proc->counter++;
        val++;
    
        if (val > 0)
            break;

        if (proc->counter > 0x28)
            break;
    }

    if (proc->counter > 0x28)
        return;

    child = Proc_Start(ProcScr_EmitSingleStar, proc);
    child->loc_x = (proc->xloc - 0x8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x20;
    child->loc_y = (proc->yloc + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

    Calcs_Interpolate(
            &child->loc_x,
            &child->loc_y,
            proc->xdiff_const,
            proc->ydiff_const,
            proc->stars <= 0x100 ? proc->stars : 0x100
        );

    proc->counter++;

    if (proc->stars >= 0)
        proc->stars = proc->stars + 8;
    
    if (proc->stars > 0x140) {
        Proc_Break(proc);
        proc->stars = 0;
        proc->star_cannot_move = 1;
    }
}
