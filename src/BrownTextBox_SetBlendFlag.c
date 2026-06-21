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

void BrownTextBox_SetBlendFlag(struct BrownTextBoxProc * proc, s8 doBlend)
{
    int db = (s8)doBlend;

    if (proc)
    {
        if (db)
        {
            proc->oam0Attr = OAM0_BLEND;
        }
        else
        {
            proc->oam0Attr = 0;
        }
    }
}
