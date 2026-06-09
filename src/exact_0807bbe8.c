#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"




































































void HideMu(struct MuProc * proc)
{
    proc->hidden_b = true;
}

void ShowMu(struct MuProc * proc)
{
    proc->hidden_b = false;
}

void SetMuScreenPosition(struct MuProc * proc, int x, int y)
{
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
}

void SetMuScreenOffset(struct MuProc * proc, int xOff, int yOff)
{
    proc->x_offset_q4 = xOff << MU_SUBPIXEL_PRECISION;
    proc->y_offset_q4 = yOff << MU_SUBPIXEL_PRECISION;
}
