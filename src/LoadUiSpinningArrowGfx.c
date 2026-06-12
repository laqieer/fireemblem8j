#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiSpinningArrows[];

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int kind;
    /* 30 */ int flags;
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int unk_44[2]; // first arrow current frame?
    /* 4C */ int unk_4c[2]; // second arrow current frame?
    /* 54 */ u16 oam2;
};

//! FE8U = 0x080ACCF4
ProcPtr LoadUiSpinningArrowGfx(int kind, int chr, int palId)
{
    int oam2Chr;
    int oam2Pal;

    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        ApplyPalette(Pal_MapBattleInfoNum, palId + 0x10);

        if (kind == 0)
        {
            Decompress(gImg_UiSpinningArrow_Horizontal, (void *)(chr + 0x06010000));
        }

        if (kind == 1)
        {
            Decompress(Img_SpinningArrow, (void *)(chr + 0x06010000));
        }

        oam2Chr = chr >> 5;
        oam2Pal = OAM2_PAL(palId);
        proc->oam2 = oam2Chr + oam2Pal;

        proc->kind = kind;
    }

    // return proc;
}
