#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "uiutils.h"

extern const struct MenuDef MenuDef_RouteSplit;

void CallRouteSplitMenu(ProcPtr proc)
{
    ClearBg0Bg1();

    SetDispEnable(1, 1, 1, 1, 1);

    SetTextFont(0);
    InitSystemTextFont();
    LoadUiFrameGraphics();

    StartMenu(&MenuDef_RouteSplit, proc);
}
