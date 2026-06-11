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

void PopupProc_WaitForPress(struct PopupProc * proc)
{
    if (proc->clock < 0) {
        if (0 != gKeyStatusPtr->newKeys) {
            Proc_Break(proc);
            return;
        } 
    } else if (0 != proc->clock) {
        proc->clock--;
        if (0 == proc->clock)
            Proc_Break(proc);
    }
}
