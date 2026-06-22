#include "global.h"

#include <stdlib.h>

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"

#include "statscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08089AC4
void DisplayPage2(void)
{
    if (UnitHasMagicRank(gStatScreen.unit))
    {
        DisplayTexts(sPage2TextInfo_Magical);

        DisplayWeaponExp(0, 1, 1, ITYPE_ANIMA);
        DisplayWeaponExp(1, 1, 3, ITYPE_LIGHT);
        DisplayWeaponExp(2, 9, 1, ITYPE_DARK);
        DisplayWeaponExp(3, 9, 3, ITYPE_STAFF);
    }
    else
    {
        DisplayTexts(sPage2TextInfo_Physical);

        DisplayWeaponExp(0, 1, 1, ITYPE_SWORD);
        DisplayWeaponExp(1, 1, 3, ITYPE_LANCE);
        DisplayWeaponExp(2, 9, 1, ITYPE_AXE);
        DisplayWeaponExp(3, 9, 3, ITYPE_BOW);
    }

    DisplaySupportList();
}
