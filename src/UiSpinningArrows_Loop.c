#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations
/* TU-private data externs bound at their JP addresses */
extern u16 gSprite_UiSpinningArrows_Horizontal[];
extern u16 gSprite_UiSpinningArrows_Vertical[];

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

// clang-format on

//! FE8U = 0x080ACB34
void UiSpinningArrows_Loop(struct SpinningArrowProc * proc)
{
    int i;

    int xOam1_a = proc->x[0];
    int yOam0_a = proc->y[0];

    int xOam1_b = proc->x[1];
    int yOam0_b = proc->y[1];

    proc->unk_44[0]++;
    proc->unk_44[1]++;

    for (i = 0; i < 2; i++)
    {
        if (proc->unk_4c[i] != 0)
        {
            proc->unk_44[i] += 3;
            proc->unk_4c[i]++;
        }

        if ((proc->unk_44[i] >> 3) > 5)
        {
            proc->unk_44[i] = 0;
        }
    }

    if (proc->kind == 0)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            xOam1_a = proc->x[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            xOam1_b = proc->x[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gSprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[0] >> 3));
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_HFLIP, OAM0_Y(yOam0_b), gSprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[1] >> 3));
        }
    }

    if (proc->kind == 1)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            yOam0_a = proc->y[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            yOam0_b = proc->y[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gSprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[0] >> 3) * 2);
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_VFLIP, OAM0_Y(yOam0_b), gSprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[1] >> 3) * 2);
        }
    }

    return;
}
