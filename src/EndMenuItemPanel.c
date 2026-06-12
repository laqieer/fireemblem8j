#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "bmbattle.h"
#include "uimenu.h"
#include "icon.h"
#include "bmitem.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "menuitempanel.h"
#include "functions.h"

void EndMenuItemPanel()
{
	Proc_EndEach(gProcCmd_MenuItemPanel);
}
