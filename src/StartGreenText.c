#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

extern struct ProcCmd ProcScr_GreenTextColor[];

void StartGreenText(ProcPtr parent)
{
    if (parent != NULL)
        Proc_Start(ProcScr_GreenTextColor, parent);
    else
        Proc_Start(ProcScr_GreenTextColor, PROC_TREE_3);
}
