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

//! FE8U = 0x080AA658
void BonusClaimMenu_PromptSong4(struct ProcBonusClaimMenu * proc)
{
    if ((*(int *)((char*)proc + 0x58)) != 0)
    {
        proc->unk_4c = 0;
        StartHelpBoxExt_Unk(0x40, 0x30, 2096); // TODO: msgid "Palace Silezia[NL]added to[NL]Sound Room"
        PlaySoundEffect(SONG_5B);
        return;
    }

    Proc_Goto(proc, 0);
}
