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




void BonusClaimMenu_PromptSong3(struct ProcBonusClaimMenu * proc)
{
    if ((*(int *)((char *)proc + 0x5c)) != 0)
    {
        proc->unk_4c = 0;
        StartHelpBoxExt_Unk(0x40, 0x30, 0x831); // TODO: msgid "Sacred Dragon[.][NL]added to[NL]Sound Room"
        PlaySoundEffect(SONG_5B);
        return;
    }

    Proc_Goto(proc, 1);
}
