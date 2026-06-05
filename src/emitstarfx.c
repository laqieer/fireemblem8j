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



/* function declarations */

void ProcEmitSingleStar_Init(struct ProcEmitSingleStarFx *proc);
void ProcEmitSingleStar_Loop(struct ProcEmitSingleStarFx *proc);

void LetsEmitStars(struct ProcEmitStars *proc);
void StarsBlinking(struct ProcEmitStars *proc);


/* section.data */



struct ProcCmd CONST_DATA ProcScr_EmitStars[] = {
    PROC_REPEAT(LetsEmitStars),
    PROC_REPEAT(StarsBlinking),
    PROC_END
};

u8 CONST_DATA Img_EmitedStar[0x20] = {
    0xE0, 0x00, 0x00, 0x00, 0xEE, 0x0E, 0x00, 0x00,
    0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

void StarsBlinking(struct ProcEmitStars *proc)
{
    int blend = 0x10 - proc->stars < 0 ? 0 : 0x10 - proc->stars;

    SetBlendConfig(2, 0, 0, blend);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);

    proc->stars++;
}

void StartEmitStarsAnim(ProcPtr parent, int xloc, int yloc, int xdiff, int ydiff)
{
    struct ProcEmitStars *proc;

    RegisterDataMove(
        Img_EmitedStar,
        OBJ_CHR_ADDR(OBJCHR_EMITSTARTS),
        0x20
    );

    proc = Proc_Start(ProcScr_EmitStars, parent);

    proc->xloc = xloc;
    proc->yloc = yloc;
    proc->xdiff_const = xdiff << 0x10;
    proc->ydiff_const = ydiff << 0x10;
    proc->counter = 0;
    proc->stars = -1;
    proc->star_cannot_move = 0;
}

void ClearEmitedStars()
{
    struct ProcEmitStars *proc = Proc_Find(ProcScr_EmitStars);
    proc->stars = 0;
}

void EndEmitStars()
{
    Proc_EndEach(ProcScr_EmitStars);
}
