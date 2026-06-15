#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"

extern struct ProcCmd ProcScr_FadeCore[];

void FadeCoreEndEach(void)
{
    Proc_EndEach(ProcScr_FadeCore);
}
