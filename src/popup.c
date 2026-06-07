#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

/* .section(.bss) */
static struct PopupInstruction gPopupInst[4];
static struct Unit * gpPopupUnit;
static u16 gPopupItem;
static u32 gPopupNumber;

























/* prototypes for same-file helpers called by this run */
void BrownTextBox_SetBlendFlag(struct BrownTextBoxProc * proc, s8 doBlend);

void BrownTextBox_FadeInInit(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    BrownTextBox_SetBlendFlag(Proc_Find(ProcScr_BrownTextBox), 1);
}

void BrownTextBox_FadeInLoop(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(blendVal, 0x10 - blendVal);

    if (blendVal == 0x10)
    {
        Proc_Break(proc);
        SetBlendNone();

        BrownTextBox_SetBlendFlag(Proc_Find(ProcScr_BrownTextBox), 0);
    }
}

void BrownTextBox_FadeOutInit(struct BrownTextBoxProc * proc)
{
    proc->blendVal = 0;

    SetBlendAlpha(0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    BrownTextBox_SetBlendFlag(Proc_Find(ProcScr_BrownTextBox), 1);
}

void BrownTextBox_FadeOutLoop(struct BrownTextBoxProc * proc)
{
    int blendVal;

    proc->blendVal++;
    blendVal = proc->blendVal;

    SetBlendAlpha(0x10 - blendVal, blendVal);

    if (blendVal == 0x10)
    {
        Proc_End(Proc_Find(ProcScr_BrownTextBox));
        Proc_Break(proc);
    }
}
