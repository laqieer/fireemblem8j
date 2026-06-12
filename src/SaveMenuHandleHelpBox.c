#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

//! FE8U = 0x080A88E0
void SaveMenuHandleHelpBox(struct SaveMenuProc * proc)
{
    if ((proc->sus_slot_cur == (u8)-1) || (proc->cursor_config == 0))
    {
        CloseHelpBox();
        proc->hb_en = false;
        return;
    }

    switch (proc->main_sel_bitfile) {
    case MAIN_MENU_OPTION_RESTART:
    case MAIN_MENU_OPTION_NEW_GAME:
    case MAIN_MENU_OPTION_EXTRAS:
        if ((proc->cursor_config != 0) && (proc->hb_en == false))
        {
            LoadHelpBoxGfx(OBJ_VRAM0 + OBJCHR_SAVEMENU_SLOTSEL_HELPBOX * TILE_SIZE_4BPP, OBJPAL_SAVEMENU_SLOTSEL_HELPBOX);
            StartHelpBoxExt_Unk(0x30, 0x30, 0x701);
            proc->hb_en = true;
        }
        break;
    }
}
