#include "global.h"
#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"
#include "sio.h"
#include "sio_core.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08045DC0
void SioBat_InitSetupScreen(struct SioBatProc * proc)
{
    int i;
    char buf[15];

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    Decompress(Img_LinkArenaPlayerBanners, OBJ_CHR_ADDR(0x300));
    Decompress(gUnkData_6, OBJ_CHR_ADDR(0x340));

    for (i = 0; i < 4; i++)
    {
        ApplyPalette(gUnkData_9, 0x13 + i);
    }

    ReadMultiArenaSaveTeamName(gLinkArenaSt.unk_03, buf);

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();
    InitSioTexts();

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.linking_status[i] = 0xff;
    }

    LinkArena_UpdatePlayerStatusText();

    for (i = 0; i < 15; i++)
    {
        gUnk_74[i] = buf[i];
    }

    proc->unk_34 = 0;
    proc->unk_30 = 0;

    StartLinkArenaButtonSpriteDraw(192, 16, proc);
    proc->unk_2c = StartLinkArenaVersusSpriteDraw(80, 32, proc);

    SetupFaceGfxData(gSioPostbattle_2);
    StartFace(3, FID_ANNA + 1, 208, 80, FACE_DISP_KIND(FACE_96x80)); // JP FID_ANNA = 0x65

    StartLinkArenaTitleBanner(proc->unk_2c, gSioMain2_0[gLinkArenaSt.unk_00], 0);

    SetLinkArenaUiBlendAndWindowOff();
    PutSioText(0x6D3 + proc->unk_30, 1); // JP msgid (US MSG_748) // "Setting up. Please wait..."

    SetWinEnable(0, 0, 0);

    return;
}
