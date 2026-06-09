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
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"

// data







 void Menu_AutoHelpBox_OnInit(struct MenuProc* proc);
 void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_Frozen_OnLoop(struct MenuProc* proc);



inline
s8 HasMenuChangedItem(struct MenuProc* proc)
{
    return proc->itemCurrent != proc->itemPrevious;
}
