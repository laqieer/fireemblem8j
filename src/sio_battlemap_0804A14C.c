#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

/* prototypes for same-file helpers called by this run */
void LinkArenaBattleMap_ClearCmdBuffer(void);

//! FE8U = 0x08049350
u16 LinkArenaBattleMap_SendCommand(u8 a, u8 b, u8 c, u8 d)
{
    LinkArenaBattleMap_ClearCmdBuffer();

    gUnk_45[0] = a;
    gUnk_45[1] = b;
    gUnk_45[2] = c;
    gUnk_45[3] = d;

    if (gLinkArenaSt.unk_00 == 2)
    {
        return SioEmitData(gUnk_45, 4);
    }

    return 0;
}
