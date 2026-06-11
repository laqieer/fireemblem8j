#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"

//! FE8U = 0x080BDFA4
void GmMu_StartMoveToPosition(struct GMapMuProc * muProc, struct UnknownSub80BDFA4 * input)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[input->unk_00];

    muPrimProc->unk_48 = input->unk_06;
    muPrimProc->unk_4a = input->unk_08;
    muPrimProc->unk_4c = input->unk_0a;
    muPrimProc->unk_4e = input->unk_0c;
    muPrimProc->unk_50 = input->unk_10;

    muPrimProc->flags_2 = input->unk_02;

    muPrimProc->unk_2f = input->unk_01;
    muPrimProc->unk_42 = input->unk_0e;

    muPrimProc->flags_0 = 1;
    muPrimProc->flags_1 = 0;
    muPrimProc->unk_2c = 2;

    muPrimProc->flags_4 = 1;
    muPrimProc->flags_5 = input->unk_03;

    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = input->unk_04;
    muPrimProc->unk_32 = input->unk_05;

    Proc_Goto(muPrimProc, 2);

    return;
}
