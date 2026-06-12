#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmcontainer.h"
#include "icon.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bb.h"
#include "bmunit.h"
#include "bmmenu.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmmind.h"
#include "popup.h"
#include "face.h"
#include "scene.h"
#include "helpbox.h"
#include "menuitempanel.h"
#include "prepscreen.h"

int ConvoyMenuProc_MenuEnd(ProcPtr proc)
{
    EndSubtitleHelp();
    EndMenuItemPanel();

    /* this should be item to be sent to convoy */
    if (0 == gBmSt.itemUnk2E) {
        Proc_Goto(proc, 0x63);
        return 1;
    }

    return 0;
}
