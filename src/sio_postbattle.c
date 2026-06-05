#include "global.h"

#include "face.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmio.h"
#include "prepscreen.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

/**
 * Battle result screen for the Link Arena.
 * Not to be confused with "sio_result.c", which refers to the
 * "Battle Data" UI.
 */

// clang-format off





s16 const gSioPostbattle_0[5][4] =
{
    { -1, -1, -1, -1, },

    { -1, -1, -1, -1, },

    { 7, 13, -1, -1, },

    { 5, 10, 15, -1, },

    { 2, 7, 12, 17, },
};



//! FE8U = 0x08045640
void SioPostBattle_Init(struct SioPostBattleProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    Decompress(Img_LinkArenaPlayerBanners, (void *)(0x06016000));
    Decompress(Img_LinkArenaPlacementRanks, (void *)(0x06016800));

    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);
    ApplyPalette(Pal_LinkArenaPlacementRanks, 0x17);

    Decompress(Img_LinkArenaActiveBannerFx, (void *)(0x06000F00));
    ApplyPalette(Pal_LinkArenaActiveBannerFx, 2);

    Decompress(Img_LinkArenaPostBattleBg, (void *)(VRAM + GetBackgroundTileDataOffset(3)));
    ApplyPalettes(Pal_LinkArenaPostBattleBg, 10, 4);
    Decompress(Tsa_LinkArenaPostBattleBg, gGenericBuffer);
    CallARM_FillTileRect(gBG3TilemapBuffer, gGenericBuffer, 0xa000);

    InitSpriteTextFont(&Font_Sio_0, (void *)(0x06012000), 0xe);
    ApplyPalette(Pal_Text, 0x1E);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    for (i = 0; i < 2; i++)
    {
        InitSpriteText(&Texts_1[i]);
        SpriteText_DrawBackgroundExt(&Texts_1[i], 0);
    }

    proc->unk_40 = gSioSt->unk_007;
    proc->unk_41 = gSioSt->unk_007;
    proc->playerId = gSioSt->selfId;

    CpuFill16(0, proc->unk_44, sizeof(proc->unk_44));
    Sio_SortPlayersByScore(proc->unk_44);

    SioPostBattle_DrawRankingText(proc);

    proc->unk_64 = 176;

    BG_SetPosition(2, 0, 176);

    SetWinEnable(0, 0, 0);

    SetBlendAlpha(8, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SioPostBattle_StartMusicProc(proc);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080457F8
void SioPostBattle_Loop_Main(struct SioPostBattleProc * proc)
{
    int fid;

    int unk_40 = proc->unk_40;

    proc->unk_64--;
    BG_SetPosition(2, 0, proc->unk_64);

    UpdateLinkArenaActiveBannerBgGlow();

    if (proc->unk_41 != 0)
    {
        if ((proc->unk_64 >> 3) == (gSioPostbattle_0[unk_40][(proc->unk_41 - 1)] + 4))
        {
            SioPostBattle_DrawRankingRowBar(proc);
            BG_EnableSyncByMask(BG2_SYNC_BIT);

            fid = gUnk_Sio_16.unk_24[proc->unk_44[(proc->unk_41 - 1)].playerId];
            proc->unk_2c[(proc->unk_41 - 1)] =
                StartDrawLinkArenaRankSprites(proc, 40, fid, proc->unk_44[(proc->unk_41 - 1)].playerId, (proc->unk_41 - 1));

            proc->unk_41--;
        }
    }

    if (proc->unk_64 == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804589C
void SioPostBattle_AwaitAPress(ProcPtr proc)
{
    UpdateLinkArenaActiveBannerBgGlow();

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        m4aMPlayFadeOut(gMPlayTable[gSongTable[0x81].ms].info, 1);
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x080458E8
void SioPostBattleMusic_PlayFanfare(struct SioPostBattleMusicProc * proc)
{
    if (proc->isPlayerWinner != 0)
    {
        StartBgmExt(SONG_COLOSSEUM_VICTORY, 0, 0);
    }
    else
    {
        StartBgmExt(SONG_COLOSSEUM_DEFEAT, 0, 0);
    }

    PlaySoundEffect(SONG_81);

    return;
}

//! FE8U = 0x08045920
void SioPostBattleMusic_PlayStandardBgm(void)
{
    StartBgmExt(SONG_COLOSSEUM_DEFEAT, 0, 0);
    return;
}
