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

/* prototypes for same-file helpers called by this run */
u8 SaveMenuGetBitfile(u8 bitfile, u32 number);

//! FE8U = 0x080A96EC
void SaveMenuWaitSlotBoxScrolling(struct SaveMenuProc * proc)
{
    if (proc->scroll_cnt == 8)
    {
        SaveMenuInitSaveSlotData(proc->sus_slot, proc);
        SaveMenuInitSaveSlotData(4, proc);

        if (proc->chapter_idx[proc->sus_slot] != (u8)-1)
            PutChapterTitleGfx(((u32)(proc->sus_slot * 0x800 + (OBJ_PRIORITY(2) + OBJCHR_SAVEMENU_TITLEGFX) * TILE_SIZE_4BPP) & 0x0001FFFF) >> 5, proc->chapter_idx[proc->sus_slot]);
        else
            PutChapterTitleGfx(((u32)(proc->sus_slot * 0x800 + (OBJ_PRIORITY(2) + OBJCHR_SAVEMENU_TITLEGFX) * TILE_SIZE_4BPP) & 0x0001FFFF) >> 5, -1);

        SaveMenuInitSlotPalette(proc->sus_slot);
    }
    else if (proc->scroll_cnt == 0x20)
    {
        InitSaveMenuChoice(proc);

        if (proc->main_sel_bitfile == MAIN_MENU_OPTION_NEW_GAME)
        {
            Proc_Goto(proc, PL_SAVEMENU_NEW_GAME);
            StartBgmVolumeChange(0xc0, 0, 0x10, 0);
        }
        else if (proc->main_sel_bitfile == MAIN_MENU_OPTION_INVALID)
        {
            Proc_Goto(proc, PL_SAVEMENU_EXIT_FADE);
        }
        else if (SaveMenuHasOptions(proc))
        {
            if (proc->cursor_slot != (u8)-1)
            {
                proc->sus_slot = proc->cursor_slot;
                proc->cursor_slot = -1;
            }
            else
                proc->sus_slot = SaveMenuModifySaveSlot(proc->sus_slot, 1, 1);

            Proc_Goto(proc, PL_SAVEMENU_SAVE_SLOT_SEL);
        }
    }
    else if (proc->scroll_cnt == 0x30)
    {
        proc->sus_slot = 0;
        proc->cursor_slot = -1;
        proc->scroll_cnt = 0;
        proc->main_select = 0;
        proc->main_sel_bitfile = SaveMenuGetBitfile(proc->main_options, 0);

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, PL_SAVEMENU_BACK_TO_MAIN);

        return;
    }

    if (proc->scroll_cnt == 0x10)
    {
        SetObjAffine(
            proc->sus_slot,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
    }
    else
    {
        if ((proc->scroll_cnt <= 7))
        {
            SetObjAffine(
                proc->sus_slot,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, (proc->scroll_cnt * -0x20) + 0x100),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, (proc->scroll_cnt * -0x20) + 0x100)
            );
        }
        else if ((proc->scroll_cnt < 0x10))
        {
            SetObjAffine(
                proc->sus_slot,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, (proc->scroll_cnt * 0x20) - 0xE0),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, (proc->scroll_cnt * 0x20) - 0xE0)
            );
        }
    }
    proc->scroll_cnt++;
}
