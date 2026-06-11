#include "global.h"
#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "bmmind.h"
#include "scene.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "bmlib.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "gba_sprites.h"
#include "constants/faces.h"
#include "constants/items.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_ShopFadeIn[];
extern struct ProcCmd gProcScr_ShopFadeOut[];

u16 ShopSt_GetHeadLoc(void);
void DrawShopSoldItems(struct ProcShop * proc);

void Shop_Loop_UnkKeyHandler(struct ProcShop * proc)
{
    u8 head_loc;
    u32 cursor_at_head;
    int a;
    int b;

    Shop_TryMoveHandPage();

    BG_SetPosition(BG_2, 0, ShopSt_GetBg2Offset());

    head_loc = proc->head_loc;
    cursor_at_head = ShopSt_GetHeadLoc() != head_loc;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    a = proc->head_loc;
    a *= 16;

    b = ((proc->hand_loc * 16)) - 0x48;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive) && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
    }

    DisplayShopUiArrows();

    if (IsShopPageScrolling())
        return;

    if (proc->helpTextActive)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = TRUE;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, 12);
        return;
    }
}

void StartShopFadeIn(struct ProcShop * proc)
{
    if (!(gBmSt.gameStateBits & BM_FLAG_PREPSCREEN) && !(gGMData.state.bits.state_0))
        Proc_StartBlocking(gProcScr_ShopFadeIn, proc);
}

void StartShopFadeOut(struct ProcShop * proc)
{

    if (!(gBmSt.gameStateBits & BM_FLAG_PREPSCREEN) && !(gGMData.state.bits.state_0))
    {
        Proc_StartBlocking(gProcScr_ShopFadeOut, proc);
        return;
    }
    ResetDialogueScreen();
}

void Shop_Init(struct ProcShop * proc)
{
    int i;

    if (proc->shopType == SHOP_TYPE_ARMORY)
        StartBgm(SONG_ARMORIES, 0);
    else
        StartBgm(SONG_SHOPS, 0);

    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitTalk(0x200, 2, 0);

    ResetFaces();

    proc->head_loc = 0;
    proc->head_idx = 0;
    proc->hand_idx = 0;
    proc->hand_loc = 0;
    proc->buy_or_sel = SHOP_ST_BUY;
    proc->helpTextActive = 0;

    UnpackUiVArrowGfx(OBJCHR_SHOP_SPINARROW, OBJPAL_SHOP_SPINARROW);

    StartTalkFace(Shop_GetPortraitIndex(proc), 32, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    DrawUiFrame2(6, 8, 20, 12, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

    for (i = 0; i < SHOP_ITEM_LINE; i++)
        InitText(&gShopItemTexts[i], 20);

    DrawShopSoldItems(proc);

    SetWinEnable(1, 1, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    SetWin0Box(56, 72, 240, 152);
    SetWin1Box(0, 8, 240, 56);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    ApplyPalette(Pal_CommGameBgScreenInShop, BGPAL_SHOP_MAINBG);
    Decompress(Img_CommGameBgScreen, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_3));
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_CommGameBgScreenInShop, OBJ_PALETTE(BGPAL_SHOP_MAINBG));

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

void StartUiGoldBox(ProcPtr parent)
{
    struct ProcShop * proc;

    Decompress(Img_ShopGoldBox, OBJ_CHR_ADDR(OBJCHR_SHOP_GOLDBOX));

    proc = Proc_Start(gProcScr_GoldBox, parent);
    proc->goldbox_x = 0xAC;
    proc->goldbox_y = 0x2D;
    proc->goldbox_oam2 = OBJ_PALETTE(OBJPAL_SHOP_GOLDBOX) + OBJ_CHAR(OBJCHR_SHOP_GOLDBOX);
    ApplyPalette(gUiFramePaletteA, 0x10 + OBJPAL_SHOP_GOLDBOX);
    InitGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 28, 6));
    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));
}

void InitGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    InitText(&gText_GoldBox, 1);
    PutSpecialChar(tm, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);
}
