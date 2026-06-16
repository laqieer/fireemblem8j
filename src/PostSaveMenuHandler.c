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


void PostSaveMenuHandler(struct SaveMenuProc * proc)
{

    if (proc->approc != 0)
        APProc_Delete(proc->approc);

    Proc_End(proc->savedraw);

    SetPrimaryHBlankHandler(0);

    if (proc->main_sel_bitfile == 0x20) {
        switch (proc->extra_sel_bitfile) {
            case 1:
                SetNextGameActionId(GAME_ACTION_6);
                return;
            case 0x10:
                SetNextGameActionId(GAME_ACTION_C);
                gPlaySt.chapterStateBits |= PLAY_FLAG_POSTGAME;
                return;
        }
    } else if (proc->main_sel_bitfile & 0x40) {
        return;
    } else if (proc->main_sel_bitfile & 0x100) {
        StartBgmVolumeChange(0xc0, 0x100, 0x10, 0);
        if ((proc->main_sel_bitfile & 0x80) != 0) {
            SetNextGameActionId(GAME_ACTION_A);
        } else {
            SetNextGameActionId(GAME_ACTION_5);
        }
    } else if (proc->main_sel_bitfile & 1) {
        ReadSuspendSave(3);
        SetNextGameActionId(GAME_ACTION_4);
    } else if (proc->main_sel_bitfile & 0x82) {
        ReadGameSave(proc->sus_slot);
        SetNextGameActionId(proc->sus_slot + 1);
    } else if (proc->main_sel_bitfile & 0x10) {
        SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
    }
}
