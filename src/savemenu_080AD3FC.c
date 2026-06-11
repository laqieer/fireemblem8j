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
int LoadSaveMenuInfo(int slot);
void InitSaveMenuHelpTextSt(void);
void SaveMenuCopyPalette(u16 * src, u16 * dst, int count);

//! FE8U = 0x080A89E4
bool SaveMenuWaitHelpBoxAnim(struct SaveMenuProc * proc)
{
    /**
     * During open/close helpbox, player cannot control via button.
     * Here we give the helpbox 8 frame on switching.
     */

    int time, _timer_default = CTRL_TIMER_MAX;

    if (proc->ctrl_timer == CTRL_TIMER_MAX)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON | DPAD_ANY))
        {
            CloseHelpBox();
            proc->ctrl_timer = CTRL_TIMER_MAX - 1;
        }
    }
    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        switch (LoadSaveMenuInfo(proc->sus_slot)) {
        case 0:
            PlaySoundEffect(SONG_6C);
            break;

        case 1:
        case 2:
            LoadHelpBoxGfx(OBJ_VRAM0 + OBJCHR_SAVEMENU_SLOTSEL_HELPBOX * TILE_SIZE_4BPP, OBJPAL_SAVEMENU_SLOTSEL_HELPBOX);
            StartItemHelpBox(0x50, proc->sus_slot * 0x20 + 0x2c, (u16)-2);
            proc->ctrl_timer = _timer_default;
            break;
        }
    }

    time = proc->ctrl_timer;
    if (time == 0)
        return false;

    if (time < _timer_default)
        proc->ctrl_timer--;

    time = proc->ctrl_timer;
    if (time != 0)
        return true;

    return false;
}

//! FE8U = 0x080A8A9C
void SaveMenuPutChapterTitle(struct SaveMenuProc * proc)
{
    int i;
    PutChapterTitleBG(OBJ_PRIORITY(2) + OBJ_CHAR(OBJCHR_SAVEMENU_TITLEBG));
    for (i = 0; i < 3; i++)
    {
        if (proc->chapter_idx[i] != (u8)-1)
            PutChapterTitleGfx((((OBJ_PRIORITY(2) + OBJCHR_SAVEMENU_TITLEGFX) * TILE_SIZE_4BPP + (0x800 * (u32)i)) & 0x1FFFF) / TILE_SIZE_4BPP, proc->chapter_idx[i]);
        else
            PutChapterTitleGfx((((OBJ_PRIORITY(2) + OBJCHR_SAVEMENU_TITLEGFX) * TILE_SIZE_4BPP + (0x800 * (u32)i)) & 0x1FFFF) / TILE_SIZE_4BPP, -1);
    }
}

//! FE8U = 0x080A8AF0
void SaveMenu_SetLcdChapterIdx(void)
{
    int node;
    u32 chapterId;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE))
    {
        chapterId = gPlaySt.chapterIndex;

        if ((gGMData.state.raw & 3) == 3)
        {
            if (chapterId > CHAPTER_L_1 && chapterId != CHAPTER_CASTLE_FRELIA)
            {
                node = GetNextUnclearedNode(&gGMData);
                if (node < 0)
                    node = 0;

                gPlaySt.chapterIndex = WMLoc_GetChapterId(node);
            }
        }
        else if (gPlaySt.chapterIndex == CHAPTER_L_5 && CheckFlag(EVFLAG_136) != 0)
            gPlaySt.chapterIndex = CHAPTER_CASTLE_FRELIA;
        else if (chapterId != CHAPTER_L_1 && chapterId != CHAPTER_E_9 && chapterId != CHAPTER_I_9)
        {
            if (gPlaySt.save_menu_type != 2 && !(gBmSt.gameStateBits & BM_FLAG_PREPSCREEN))
                    gPlaySt.chapterIndex = GetChapterIndexOnWmNode(&gGMData);
        }
    }

    InitSaveMenuHelpTextSt();

    SetupBackgrounds(gBgConfig_SaveMenu);
    SetDispEnable(0, 0, 0, 0, 0);
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendConfig(1, 6, 0x10, 0);
}

//! FE8U = 0x080A8C2C
void SaveMenu_Init(void)
{
    InitSaveMenuHelpTextSt();

    SetupBackgrounds(gBgConfig_SaveMenu);
    SetDispEnable(0, 0, 0, 0, 0);
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendConfig(1, 6, 0x10, 0);
}

//! FE8U = 0x080A8CD4
void SaveMenu_InitScreen(struct SaveMenuProc * proc)
{
    int i;

    ResetTextFont();

    LoadUiFrameGraphics();
    LoadObjUIGfx();

    ApplyPalettes(Pal_SaveMenuBG, OBJPAL_SAVEMENU_TITLEBG, 8);
    Decompress(Img_SaveMenuBG, (void*)BG_VRAM + GetBackgroundTileDataOffset(BG_3));
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);

    ApplyPalette(Pal_MainMenuBgFog, BGPAL_SAVEMENU_BGFOG);
    Decompress(Img_MainMenuBgFog, (void*)BG_VRAM + GetBackgroundTileDataOffset(BG_3) + BGCHR_SAVEMENU_BGFOG * TILE_SIZE_4BPP);
    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);
    CallARM_FillTileRect(
        gBG2TilemapBuffer,
        gGenericBuffer,
        OBJ_PALETTE(BGPAL_SAVEMENU_BGFOG) + OBJ_PRIORITY(0) + OBJ_CHAR(BGCHR_SAVEMENU_BGFOG));

    Decompress(Img_SaveScreenSprits, OBJ_VRAM0 + OBJCHR_SAVEMENU_SPRITES * TILE_SIZE_4BPP);
    ApplyPalettes(Pal_SaveScreenSprits, OBJPAL_SAVEMENU_SPRITES + 0x10, 8);

    ApplyPalette(Pal_MenuMainObjs_0, 2);
    SaveMenuCopyPalette(PAL_OBJ(0x2), PAL_OBJ(0x1), 1);
    SaveMenuCopyPalette(gMenuMainObjs_5, gEndingTmScratchA, 2);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->scroll_cnt = 0;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;

    proc->cursor_config = 0;
    proc->cursor_slot = -1;
    proc->unk_3d = 0;

    for (i = 0; i < 4; i++)
    {
        SetObjAffine(
            i,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
    }

    proc->unk_44 = 0x100;
    proc->sus_slot_cur = -1;
    proc->hb_en = false;
    proc->ctrl_timer = 0;

    for (i = 0; i < 4; i++)
        SaveMenuInitSaveSlotData(i, proc);

    SaveMenuInitSlotPalette(proc->sus_slot);
    SaveMenuInitSubBoxText();

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SetWinEnable(0, 0, 0);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
    SaveMenuPutChapterTitle(proc);
    proc->savedraw = StartSaveDraw(proc);
}

//! FE8U = 0x080A8F04
void SaveMenu_LoadExtraMenuGraphics(struct SaveMenuProc * proc)
{
    Decompress(Img_GameMainMenuObjs, OBJ_VRAM0 + OBJCHR_SAVEMENU_MAINCHOICE_STR * TILE_SIZE_4BPP);
    InitSaveMenuChoice(proc);

    if (proc->main_sel_bitfile == MAIN_MENU_OPTION_EXTRAS)
    {
        proc->main_select = SaveMenuGetValidMenuAmt(MAIN_MENU_OPTION_EXTRAS, proc);
    }
    else
    {
        proc->jump_label = PL_SAVEMENU_MAIN_LOOP;
        proc->sus_slot = 0;
        proc->main_select = 0;
        proc->extra_select = 0;
        proc->unk_46 = 0;
        proc->main_sel_bitfile = SaveMenuGetBitfile(proc->main_options, proc->main_select);
    }

    if (proc->jump_label == PL_SAVEMENU_MAIN_LOOP)
        proc->unk_2f = 0;

    if (proc->jump_label == PL_SAVEMENU_SAVE_SLOT_SEL)
        proc->unk_2f = 0xdc;
}

//! FE8U = 0x080A8F8C
void SaveMenuInit(struct SaveMenuProc * proc)
{
    proc->jump_label = PL_SAVEMENU_SAVE_SLOT_SEL;
    proc->sus_slot = ReadLastGameSaveId();
    proc->main_select = 0;
    proc->extra_select = 0;
    proc->unk_46 = 0;
    proc->main_options = MAIN_MENU_OPTION_INVALID;
    proc->main_sel_bitfile = MAIN_MENU_OPTION_INVALID;
    proc->unk_31 = 0;
    proc->unk_2f = 0xdc;
}

//! FE8U = 0x080A8FD0
void SaveMenuInitUnused(struct SaveMenuProc * proc)
{
    proc->jump_label = PL_SAVEMENU_SAVE_SLOT_SEL;
    proc->sus_slot = ReadLastGameSaveId();
    proc->main_select = 0;
    proc->extra_select = 0;
    proc->unk_46 = 0;
    proc->main_options = MAIN_MENU_OPTION_7;
    proc->main_sel_bitfile = MAIN_MENU_OPTION_7;
    proc->unk_31 = 0;
    proc->unk_2f = 0xdc;
}

//! FE8U = 0x080A9014
void SaveMenu_JumpToTarget(struct SaveMenuProc * proc)
{
    Proc_Goto(proc, proc->jump_label);
}

//! FE8U = 0x080A9024
void SameMenu_CtrlLoop(struct SaveMenuProc * proc)
{
    proc->jump_label = PL_SAVEMENU_MAIN_LOOP;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->main_select != 0)
        {
            proc->main_select--;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        }
        else
        {
            if (gKeyStatusPtr->newKeys & DPAD_UP)
            {
                proc->main_select = proc->unk_31 - 1;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            }
        }
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->main_select < proc->unk_31 - 1)
        {
            proc->main_select++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        }
        else
        {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN)
            {
                proc->main_select = 0;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        proc->main_sel_bitfile = SaveMenuGetBitfile(proc->main_options, proc->main_select);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        proc->scroll_cnt = 0;

        switch (proc->main_sel_bitfile) {
        case MAIN_MENU_OPTION_RESUME:
            proc->sus_slot = proc->sus_slot_cur;
            Proc_Goto(proc, PL_SAVEMENU_SCROLL_SLOT);
            break;

        case MAIN_MENU_OPTION_RESTART:
        case MAIN_MENU_OPTION_COPY:
        case MAIN_MENU_OPTION_ERASE:
            proc->sus_slot = SaveMenuModifySaveSlot(ReadLastGameSaveId(), 1, 1);
            Proc_Goto(proc, PL_SAVEMENU_SCROLL_SLOT);
            break;

        case MAIN_MENU_OPTION_NEW_GAME:
            proc->sus_slot = SaveMenuModifySaveSlot(proc->sus_slot, 0, 1);
            Proc_Goto(proc, PL_SAVEMENU_DIFFICULTY_SEL);
            StartBgmVolumeChange(0xC0, 0x100, 0x10, 0);
            break;

        case MAIN_MENU_OPTION_EXTRAS:
            if (proc->extra_select >= proc->max_choice)
                proc->extra_select = 0;

            Proc_Goto(proc, PL_SAVEMENU_8);
            break;

        default:
            return;
        }
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, PL_SAVEMENU_NEW_GAME);
        proc->main_sel_bitfile = MAIN_MENU_OPTION_EXIT;
    }
}
