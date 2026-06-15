#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"

extern struct ProcCmd sProc_Menu[];
void EndMenu(ProcPtr proc);

void EndAllMenus(void)
{
    Proc_ForEach(sProc_Menu, (ProcFunc) EndMenu);
}
