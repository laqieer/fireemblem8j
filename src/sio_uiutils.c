#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

// clang-format on

//! FE8U = 0x0804CDE8
void RuleSettingSprites_Interactive_Loop(struct RuleSettingSpriteDrawProc * proc)
{
    int i;

    int y1 = proc->yNew;
    int y2 = proc->yPrevious;
    int y = (y1 + y2) * 12;

    proc->yPrevious = proc->yNew;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 32, 48 + i * 24, SpriteArray_RuleSettingIcons[i], 0);
    }

    DisplayFrozenUiHand(32, y + 48);
    DisplayUiHand(proc->xOption, proc->yOption);

    PutLinkArenaButtonSpriteAt(192, 16);

    return;
}

//! FE8U = 0x0804CE5C
void RuleSettingSprites_Static_Loop(struct RuleSettingSpriteDrawProc * proc)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 32, 48 + i * 24, SpriteArray_RuleSettingIcons[i], 0);
    }

    return;
}

// clang-format on

//! FE8U = 0x0804CE8C
ProcPtr StartRuleSettingSpriteDrawInteractive(ProcPtr parent)
{
    struct RuleSettingSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_RuleSettingSpriteDraw_Interactive);
    proc = Proc_Start(ProcScr_RuleSettingSpriteDraw_Interactive, parent);

    proc->yPrevious = 0;

    return proc;
}

// clang-format on

//! FE8U = 0x0804CEB0
void StartRuleSettingSpriteDrawStatic(void)
{
    Proc_Start(ProcScr_RuleSettingSpriteDraw_Static, PROC_TREE_3);
    return;
}

// FIXME
//! FE8U = 0x0804CEC4
void UpdateRuleSettingSprites(ProcPtr proc, s16 b, s16 xOption, s16 yOption)
{
    struct RuleSettingSpriteDrawProc * param_1 = proc;

    param_1->yNew = b;
    param_1->xOption = xOption;
    param_1->yOption = yOption;

    return;
}

//! FE8U = 0x0804CECC
void UpdateSioMenuBurstGlow(int idx)
{
    u16 * ptr = gUnkData_11;

    if (gUnk_Sio_22 == 0)
    {
        PAL_OBJ_COLOR(6, 14) = ptr[idx];
        EnablePaletteSync();
    }

    return;
}
