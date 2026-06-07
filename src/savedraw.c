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

// clang-format off





u16 CONST_DATA Sprite_Savedraw_0[] =
{
    4,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x40) + OAM2_LAYER(2),
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32 + OAM1_X(64), OAM2_CHR(0x48) + OAM2_LAYER(2),
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32 + OAM1_X(72) + OAM1_HFLIP, OAM2_CHR(0x48) + OAM2_LAYER(2),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(80) + OAM1_HFLIP, OAM2_CHR(0x40) + OAM2_LAYER(2),
};































































/* prototypes for same-file helpers called by this run */
void SaveDraw_SetCursorBox(int a, s16 b, s16 c, struct SaveDrawProc * proc);

//! FE8U = 0x080AABC4
void SaveDraw_DrawMainMenuOption(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_Savedraw_0, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, SpriteArray_SavemenuData_1[spriteIdx], OAM2_PAL(palIdB));
    return;
}

//! FE8U = 0x080AAC40
void SaveDraw_DrawExtraMenuOption(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_Savedraw_0, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, SpriteArray_SavemenuData_0[spriteIdx], OAM2_PAL(palIdB));
    return;
}

//! FE8U = 0x080AACBC
void SaveDraw_UpdateSlotPalette(struct SaveDrawProc * proc)
{
    if (proc->unk_3c != SAVE_MENU_PARENT(proc)->sus_slot)
    {
        SaveMenuInitSlotPalette(SAVE_MENU_PARENT(proc)->sus_slot);
        proc->unk_3c = SAVE_MENU_PARENT(proc)->sus_slot;
    }

    SaveDrawSetDifficultSlotPalette(proc->unk_2a, proc->unk_3c);

    EnablePaletteSync();

    if (SAVE_MENU_PARENT(proc)->sus_slot_cur != 0xff)
    {
        if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 < 0x10)
            {
                SAVE_MENU_PARENT(proc)->sus_slot_cur = 0xff;
            }
            else
            {
                // clang-format off
                SetObjAffine(
                    3,
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(-SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44)
                );
                // clang-format on
            }

            SAVE_MENU_PARENT(proc)->unk_44 -= 16;
        }
    }

    SaveMenuUpdateCursorPalette(proc->unk_2a, proc->unk_3c);
    proc->unk_2a++;

    return;
}

//! FE8U = 0x080AADE0
void SaveDraw_DrawSelectedOption(struct SaveDrawProc * proc)
{
    struct SaveMenuProc * saveMenuProc;
    u8 spriteIdx;

    int y = OAM0_Y(((SAVE_MENU_PARENT(proc)->unk_2f * 48) / 0xdc) + 0x1d0);

    PutSpriteExt(4, 48, y, Sprite_Savedraw_0, OAM2_PAL(2));

    saveMenuProc = SAVE_MENU_PARENT(proc);

    if (saveMenuProc->unk_46 != 0)
    {
        if (saveMenuProc->extra_sel_bitfile & EXTRA_MENU_OPTION_MAP)
            PutSpriteExt(4, 56, y + 8, SpriteArray_SavemenuData_1[10], OAM2_PAL(4));
        else
            PutSpriteExt(4, 56, y + 8, SpriteArray_SavemenuData_1[8], OAM2_PAL(4));
    }
    else
    {
        spriteIdx = BitfileToIndex(saveMenuProc->main_sel_bitfile);
        PutSpriteExt(4, 56, y + 8, SpriteArray_SavemenuData_1[spriteIdx], OAM2_PAL(4));
    }
}

//! FE8U = 0x080AAE90
void SaveDraw_DrawMainMenuOptions(struct SaveDrawProc * proc)
{
    int i;
    u64 tmp; // found by permuter
    int xOffset = SAVE_MENU_PARENT(proc)->unk_2f + SAVE_MENU_PARENT(proc)->unk_46;

    if (xOffset < 220)
    {
        int y = 68 - ((int)((SAVE_MENU_PARENT(proc)->unk_31) * 25) >> 1);
        if (y < 2)
        {
            y = 2;
        }

        for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_31; i++)
        {
            int spriteIdx = BitfileToIndex(SaveMenuGetBitfile(SAVE_MENU_PARENT(proc)->main_options, i));

            if (i == SAVE_MENU_PARENT(proc)->main_select)
            {
                SaveDraw_DrawMainMenuOption(proc, 48 - xOffset, y + i * 25, spriteIdx, 1, 4);
            }
            else
            {
                SaveDraw_DrawMainMenuOption(proc, 48 - xOffset, y + i * 25, spriteIdx, 6, 4);
            }
        }

        if (SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_MAIN_LOOP)
        {
            tmp = y + (SAVE_MENU_PARENT(proc)->main_select * 25);
            SaveDraw_SetCursorBox(0, 28, tmp, proc);
        }
    }

    return;
}

//! FE8U = 0x080AAF6C
void SaveDraw_DrawExtraMenuOptions(struct SaveDrawProc * proc)
{
    int i;
    int yBase;
    int yMult;
    int spriteIdx;

    u16 tmp = SAVE_MENU_PARENT(proc)->unk_46 - 1;

    if (tmp > 438)
    {
        return;
    }

    if (SAVE_MENU_PARENT(proc)->max_choice == 7)
    {
        yBase = 2;
        yMult = 21;
    }
    else
    {
        yBase = 68 - SAVE_MENU_PARENT(proc)->max_choice * 12;
        if (yBase < 2)
        {
            yBase = 2;
        }
        yMult = 25;
    }

    for (i = 0; i < SAVE_MENU_PARENT(proc)->max_choice; i++)
    {
        spriteIdx = BitfileToIndex(SaveMenuGetBitfile(SAVE_MENU_PARENT(proc)->extra_options, i));

        if (i == SAVE_MENU_PARENT(proc)->extra_select)
        {
            SaveDraw_DrawExtraMenuOption(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 1, 4);
        }
        else
        {
            SaveDraw_DrawExtraMenuOption(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 6, 4);
        }
    }

    if (SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_10)
        SaveDraw_SetCursorBox(0, 28, yBase + SAVE_MENU_PARENT(proc)->extra_select * yMult, proc);
}
