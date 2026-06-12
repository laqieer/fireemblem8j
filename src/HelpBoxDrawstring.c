extern int DrawHelpBoxSaveMenuStats();
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"

void DrawHelpBoxWeaponStats(int item);

//! FE8U = 0x08089FCC
void HelpBoxDrawstring(struct ProcHelpBoxIntro* proc) {
    int item = proc->item;

    SetTextFont(&gHelpBoxSt.font);

    switch (GetHelpBoxItemInfoKind(item)) {
        case HB_EXTINFO_WEAPON:
            DrawHelpBoxWeaponStats(item);
            break;

        case HB_EXTINFO_SAVEINFO:
            DrawHelpBoxSaveMenuStats();
            break;
    }

    SetTextFont(0);

    Proc_Break(proc);
}
