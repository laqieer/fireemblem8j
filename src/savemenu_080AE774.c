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

extern u16 gEndingTmScratchA[];



// TODO: Implicit declaration
int LoadBonusContentData(void *);

//! FE8U = 0x080A9D20
s8 SaveMenuTryMoveExtraSlotCursor(struct SaveMenuProc * proc, int direction) {
    u8 unk = proc->sus_slot;

    if (unk > 2) {
        proc->sus_slot = 0;
    }

    if (direction == 0) {
        return 1;
    }

    if (direction > 0) {
        if (proc->sus_slot < 2) {
            proc->sus_slot = proc->sus_slot + 1;
        } else {
            proc->sus_slot = 0;
        }
    } else {
        if (proc->sus_slot == 0) {
            proc->sus_slot = 2;
        } else {
            proc->sus_slot = proc->sus_slot - 1;
        }
    }

    if (unk != proc->sus_slot) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        return 1;
    }

    return 0;
}

//! FE8U = 0x080A9D84
void SaveMenuPopupHelpBox_Init(struct SaveMenu8A20068Proc  * proc)
{
    LoadHelpBoxGfx(OBJ_VRAM0 + OBJCHR_SAVEMENU_SLOTSEL_HELPBOX * TILE_SIZE_4BPP, OBJPAL_SAVEMENU_SLOTSEL_HELPBOX);
    StartHelpBoxExt_Unk(proc->x, proc->y, proc->msgId);
    PlaySoundEffect(SONG_70);
}

//! FE8U = 0x080A9DBC
void SaveMenuPopupHelpBox_WaitInput(struct SaveMenu8A20068Proc  * proc)
{

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | R_BUTTON)) {
        PlaySoundEffect(SONG_71);
        CloseHelpBox();
        Proc_Break(proc);
    }
}
