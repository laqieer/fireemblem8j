#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "hardware.h"
#include "sysutil.h"

int PromoSubConfirm_OnInit(struct MenuProc *proc)
{
    SyncMenuBgs(proc);
    return 0;
}
