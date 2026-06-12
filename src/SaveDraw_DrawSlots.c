extern int SaveDraw_DrawPlayTime();
#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *)(proc->proc_parent))

void SaveDraw_DrawSelectedOption(struct SaveDrawProc * proc);

//! FE8U = 0x080AB05C
void SaveDraw_DrawSlots(struct SaveDrawProc * proc)
{
    int i;

    if (SAVE_MENU_PARENT(proc)->unk_2f != 0)
    {
        SaveDraw_DrawPlayTime(proc);
        SaveDraw_DrawSelectedOption(proc);

        for (i = 0; i < 3; i++)
        {
            int y;
            if ((SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_SLOT_SELECTED) && (SAVE_MENU_PARENT(proc)->sus_slot == i))
            {
                y = 0x100;
            }
            else
            {
                y = 0;
            }

            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), y + 32 + (i * 32), SpriteArray_SavemenuData_3[i],
                OAM2_PAL(i * 2 + 10));
            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), (y + 32 + (i * 32)) + 8, SpriteArray_SavemenuData_2[i],
                OAM2_PAL(i * 2 + 11));
        }

        if (SAVE_MENU_PARENT(proc)->sus_slot_cur != 0xff)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
            {
                int unused;
                if (SAVE_MENU_PARENT(proc)->approc != NULL)
                {
                    APProc_Delete(SAVE_MENU_PARENT(proc)->approc);
                    SAVE_MENU_PARENT(proc)->approc = NULL;
                }

                // redundant
                if (SAVE_MENU_PARENT(proc)->main_sel_bitfile & 1)
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->sus_slot_cur * 0x20 + 0x1e, Sprite_Savedraw_6, 0x3000);
                else
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->sus_slot_cur * 0x20 + 0x1e, Sprite_Savedraw_6, 0x3000);
            }
            else
            {
                if (SAVE_MENU_PARENT(proc)->main_sel_bitfile == 1)
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->approc, 436 - SAVE_MENU_PARENT(proc)->unk_2f,
                        SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140);
                }
                else
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->approc, 320, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140);
                    PutSpriteExt(
                        4, 422 - SAVE_MENU_PARENT(proc)->unk_2f, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 30,
                        Sprite_Savedraw_6, 0x3000);
                }
            }
        }
    }

    if ((SAVE_MENU_PARENT(proc)->jump_label) == PL_SAVEMENU_SAVE_SLOT_SEL || (SAVE_MENU_PARENT(proc)->jump_label) == PL_SAVEMENU_SLOT_SELECTED)
    {
        if (SAVE_MENU_PARENT(proc)->cursor_config != 0)
        {
            PutSpriteExt(4, 44, 128, Sprite_Savedraw_1, OAM2_PAL(2));
            DisplayUiHand(((SAVE_MENU_PARENT(proc)->cursor_config - 1) % 2) * 44 + 52, 136);
            SaveDraw_SetCursorBox(1, 12, SAVE_MENU_PARENT(proc)->sus_slot * 32 + 32, proc);
        }
        else if (SAVE_MENU_PARENT(proc)->sus_slot != 0xff)
            SaveDraw_SetCursorBox(1, 12, SAVE_MENU_PARENT(proc)->sus_slot * 32 + 32, proc);

        if (SAVE_MENU_PARENT(proc)->cursor_slot != (u8)-1)
            SaveDraw_SetCursorSlotMark(1, SAVE_MENU_PARENT(proc)->cursor_slot * 32 + 32, proc);
    }
}
