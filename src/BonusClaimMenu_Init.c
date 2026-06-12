extern int LoadBonusContentData();
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
/* TU-private data externs bound at their JP addresses */
extern struct BonusClaimEnt * _gpBonusClaimData;

//! FE8U = 0x080AA550
void BonusClaimMenu_Init(struct ProcBonusClaimMenu * proc)
{
    int i;

    CpuFill16(0, _gpBonusClaimData, 0x144);

    if (LoadBonusContentData(_gpBonusClaimData) == 0)
    {
        Proc_Goto(proc, 10);
        return;
    }

    proc->unk_5c = 0;
    proc->unk_58 = 0;

    for (i = 0; i < 0x10; i++)
    {
        struct BonusClaimEnt * ent = _gpBonusClaimData + i;

        if ((ent->unseen & 3) != 1)
        {
            continue;
        }

        if (_gpBonusClaimData[i].kind == BONUSKIND_SONG3)
        {
            proc->unk_58 = 1;
            _gpBonusClaimData[i].unseen = (_gpBonusClaimData[i].unseen & ~3) + 2;
            UnlockSoundRoomSong(NULL, 0x75);
        }

        ent = _gpBonusClaimData + i;

        if (ent->kind == BONUSKIND_SONG4)
        {
            proc->unk_5c = 1;
            _gpBonusClaimData[i].unseen = (_gpBonusClaimData[i].unseen & ~3) + 2;
            UnlockSoundRoomSong(NULL, 0x76);
        }
    }

    if ((proc->unk_58 == 0) && (proc->unk_5c == 0))
    {
        Proc_Goto(proc, 10);
        return;
    }

    LoadHelpBoxGfx(OBJ_VRAM0 + OBJCHR_SAVEMENU_SLOTSEL_HELPBOX * TILE_SIZE_4BPP, OBJPAL_SAVEMENU_SLOTSEL_HELPBOX);
}
