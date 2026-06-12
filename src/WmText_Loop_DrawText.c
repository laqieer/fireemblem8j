#include "global.h"
#include "ctc.h"
#include "scene.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u16 Sprite_WmText[];

struct GMapTextProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 drawAtBottom;
    /* 2A */ u8 visible;
};

// clang-format on

//! FE8U = 0x080C35EC
void WmText_Loop_DrawText(struct GMapTextProc * proc)
{
    int y;

    if (proc->visible == 0)
    {
        return;
    }

    y = 0;

    if (proc->drawAtBottom == 1)
    {
        y = 111;
    }

    PutSpriteExt(1, 0, y, Sprite_WmText, OAM2_PAL(2));

    return;
}
