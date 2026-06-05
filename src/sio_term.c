#include "global.h"

#include "bmlib.h"
#include "hardware.h"
#include "bmsave.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmio.h"
#include "prepscreen.h"

#include "constants/msg.h"

#include "sio.h"
#include "sio_core.h"

extern struct Font Font_0;
extern struct Text gSioTexts[];

//! FE8U = 0x08046C64
void MoveMenuCursorSkippingInvalid(int * cur, u8 bottom, u8 top, int * buf, u8 total)
{
    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) &&
        (*cur > top || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys))
    {
        do
        {
            *cur -= 1;

            if (*cur < 0)
            {
                *cur = total - 1;
            }
        } while (buf[*cur] == -1);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) &&
        (*cur < bottom || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys))
    {
        do
        {
            *cur += 1;
            *cur = *cur % total;
        } while (buf[*cur] == -1);
    }

    return;
}

//! FE8U = 0x08046CF0
void LinkArenaTeamBuild_Loop(struct SioTermProc * proc)
{
    int current = proc->unk_48;

    MoveMenuCursorSkippingInvalid(&proc->unk_48, proc->unk_50, proc->unk_4c, proc->unk_38, 3);
    DisplayUiHand(28, 40 + proc->unk_48 * 32);

    if (current != proc->unk_48)
    {
        SioPlaySoundEffect(3);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        SioPlaySoundEffect(2);
        Proc_Break(proc);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x08046D6C
void LinkArenaTeamBuild_LoadSelectedSave(struct SioTermProc * proc)
{
    ReadGameSave(proc->unk_48);

    gPlaySt.chapterStateBits &= ~(PLAY_FLAG_COMPLETE);
    gPlaySt.config.windowColor = 0;
    gLinkArenaSt.unk_04 = proc->unk_48;

    ApplyUnitSpritePalettes();
    LinkArenaBattleMap_InitChapter();

    BG_SetPosition(BG_1, 0, 0);

    return;
}

//! FE8U = 0x08046DB4
void LinkArenaTeamBuild_GotoExitIfNoCursor(ProcPtr proc)
{
    if (gLinkArenaSt.unk_03 == 0xFF)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x08046DD0
void LinkArenaTeamBuild_GotoIfNoSelection(ProcPtr proc)
{
    if (gLinkArenaSt.unk_04 == 0xFF)
    {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x08046DEC
void LinkArenaTeamBuild_WaitAtMenu(ProcPtr proc)
{
    if (Proc_Find(ProcScr_AtMenu) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08046E0C
void LinkArenaTeamBuild_OnTacticianDone(ProcPtr proc)
{
    if (gUnk_Sio_12 == 0)
    {
        return;
    }

    ClearSioBGFull();
    Nop_SioUiutils_0();
    EndLinkArenaTitleBanner();
    ResetLinkArenaUiBlend();
    EndLinkArenaButtonSpriteDraw();

    BMapVSync_End();
    StartPrepAtMenu();

    Proc_Goto(proc, 5);

    return;
}

//! FE8U = 0x08046E4C
void LinkArenaTeamBuild_ResetBg1Position(void)
{
    BG_SetPosition(BG_1, 0, 0);
    return;
}
