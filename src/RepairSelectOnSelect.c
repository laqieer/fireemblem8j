#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "bmitemuse.h"
#include "constants/songs.h"

u8 RepairSelectOnSelect(ProcPtr proc, struct SelectTarget* target)
{
    ResetTextFont();

    gActionData.targetIndex = target->uid;

    ForceMenuItemPanel(
        StartOrphanMenu((const struct MenuDef *)0x085C5544),
        GetUnit(gActionData.targetIndex),
        16, 11);

    StartFace(0, GetUnitPortraitId(GetUnit(gActionData.targetIndex)), 184, 12, FACE_96x80);
    SetFaceBlinkControlById(0, 5);

    return TARGETSELECTION_ACTION_ENDFAST | TARGETSELECTION_ACTION_END | TARGETSELECTION_ACTION_SE_6A | TARGETSELECTION_ACTION_CLEARBGS;
}
