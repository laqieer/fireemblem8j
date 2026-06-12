#include "global.h"

#include "bmunit.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "unitlistscreen.h"
#include "uiutils.h"
#include "prepscreen.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"

extern struct ProcCmd ProcScr_SioTeamList[];

struct LinkArenaTeamEnt
{
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

extern struct LinkArenaTeamEnt gLinkArenaTeamList[];

struct LATeamListConfig
{
    /* 00 */ u8 kind;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 helpTextId; // Text that displays across the bottom
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ int menuTextId;
    /* 0C */ bool (*isValidFunc)(void);
};

// Forward declarations

int DrawLinkArenaTeamListMenu(u8, struct SioTeamListProc *);
bool CanBuildNewLinkArenaTeam(void);
bool AnyLinkArenaTeamExists(void);

enum
{
    MULTIARENA_LIST_NONE = 0,
    MULTIARENA_LIST_BUILDTEAM = 1,
    MULTIARENA_LIST_SELECTTEAM = 2,
    MULTIARENA_LIST_UNITLIST = 3,
    MULTIARENA_LIST_SWAP = 4,
    MULTIARENA_LIST_CONFIRMSWAP = 5,
    MULTIARENA_LIST_DISBAND = 6,
    MULTIARENA_LIST_LINKMENU = 7,
    MULTIARENA_LIST_8 = 8,
};

// clang-format off







// clang-format on

extern char gUnk_Sio_14[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_7[];

/* prototypes for same-file helpers called by this run */
int LoadLinkArenaTeamList(int activeOption, u8 mode);
void DrawAllLinkArenaTeamNames(struct SioTeamListProc * proc);
int DrawLinkArenaTeamListMenu(u8 mode, struct SioTeamListProc * proc);
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc);

//! FE8U = 0x08043904
void SioTeamList_SetupGfx(struct SioTeamListProc * proc)
{
    int i;
    u8 buf[8];

    u16 * textPalette = Pal_Text;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 9, 4), gUnkData_14, TILEREF(0x0, 1));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    Decompress(gUnkData_6, OBJ_CHR_ADDR(0x300));
    ApplyPalettes(gUnkData_74, 0x11, 2);

    gPaletteBuffer[0x20] = 0;

    for (i = 0; i < 3; i++)
    {
        gPaletteBuffer[0x21 + i] = textPalette[4 + i];
    }

    EnablePaletteSync();

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    InitSioTexts();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();
    ForceSyncUnitSpriteSheet();

    proc->unk_38 = LoadLinkArenaTeamList(proc->optionIdx, gLinkArenaSt.unk_00);

    for (i = 0; i < 5; i++)
    {
        buf[i] = 0;
    }

    buf[proc->optionIdx] = 1;

    proc->numActiveOptions = DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);

    DrawAllLinkArenaTeamNames(proc);

    proc->unk_2c = StartSioTeamMenuSpriteDraw(proc, proc->numActiveOptions, buf);

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_06[i] = 0xff;
    }

    proc->unk_5c = 0;

    BG_SetPosition(BG_1, 0, proc->yBg1);

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);
    SetWin1Box(0, 136, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 0, 1, 1, 0);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaTitleBanner(proc->unk_2c, gSioMain2_0[gLinkArenaSt.unk_00], 0);
    SetLinkArenaUiBlend();

    PutSioText(GetLATeamListHelpTextId(proc), 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}
