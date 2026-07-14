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
#include "functions.h"
#include "constants/faces.h"
#include "constants/items.h"
#include "constants/songs.h"

/* Shop data + fade ProcScrs (issue #143 menu pass), ROM 0x08ABC768..0x08ABC808,
 * kept consecutive here because StartShopScreen (src/bmshop_080B8DC8.c)
 * deliberately reads through the gDefaultShopInventory/gShopDialogueOffsetLut/
 * gShopPortraitLut boundary as 21 halfwords. gShopDialogueOffsetLut and
 * gShopPortraitLut were previously compiled into NOLOAD sections pinned by
 * layout/carved_ram.d/perfrag_bmshop.tsv + masked_layer.tsv (address-binding
 * only -- their compiled bytes were discarded by the linker; the real ROM
 * bytes still came from frontier_df4_menu_037_AB7144's raw incbin tail).
 * gShopPortraitLut is moved here from src/masked_080b8cdc.c and rewritten
 * with the exact JP face IDs (0x66/0x67/0x69) instead of fe8u's FID_SHOP_*
 * constants (0x65/0x66/0x68), which do not match the JP ROM bytes at this
 * address. */
u16 gDefaultShopInventory[8] __attribute__((section(".data.frontier_df4_menu.gap37_shop"))) = {
    1, 0x14, 0x1F, 0x2D, 0x38, 0x4B, 0, 0
};

int gShopDialogueOffsetLut[3] __attribute__((section(".data.frontier_df4_menu.gap37_shop"))) = {
    [SHOP_TYPE_ARMORY]      = 0,
    [SHOP_TYPE_VENDOR]      = 1,
    [SHOP_TYPE_SECRET_SHOP] = 2
};

/* Exact JP face IDs (not fe8u's FID_SHOP_* constants, which are off by one). */
int gShopPortraitLut[3] __attribute__((section(".data.frontier_df4_menu.gap37_shop"))) = {
    0x66, 0x67, 0x69
};

/* gProcScr_ShopFadeIn[7] @0x08ABC790: previously frontier_df4_menu_037_AB7144's
 * "residue" first word (0x00000002, a bare PROC_CALL opcode that was
 * misclassified as raw data) + the already-typed frontier_df4_menu_037_AB7144_1
 * array; that array is now folded into these two named scripts. */
struct ProcCmd gProcScr_ShopFadeIn[7] __attribute__((section(".data.frontier_df4_menu.gap37_shop"))) = {
    PROC_CALL(LockGame),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, -1),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_END,
};

/* gProcScr_ShopFadeOut[8] @0x08ABC7C8. */
struct ProcCmd gProcScr_ShopFadeOut[8] __attribute__((section(".data.frontier_df4_menu.gap37_shop"))) = {
    PROC_CALL(ResetDialogueScreen),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};

extern struct ProcCmd CONST_DATA gProcScr_Shop[];

extern struct ProcCmd CONST_DATA ProcScr_ShopBuyInit[];

extern struct ProcCmd CONST_DATA ProcScr_ShopSellInit[];



extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];



extern EWRAM_DATA struct Text gShopItemTexts[SHOP_TEXT_LINES + 1];
extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;
extern struct Text gText_GoldBox;

void StartShopDialogue(int baseMsgId, struct ProcShop * proc)
{
    int msgId = baseMsgId + gShopDialogueOffsetLut[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);
}
