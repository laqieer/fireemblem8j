#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"













ProcPtr MergeGenericProc(ProcPtr parent, ProcFunc init, ProcFunc loop, ProcFunc dest) {
    struct ProcCmd code[] = {
        PROC_SET_END_CB(dest),
        PROC_CALL(init),
        PROC_REPEAT(loop),
        PROC_END
    };

    memcpy(gGenericProc, code, sizeof code);
    return Proc_Start(gGenericProc, parent);
}
