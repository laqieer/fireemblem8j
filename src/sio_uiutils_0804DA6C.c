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

/* TU-private data externs bound at their JP addresses */
extern const u16 * CONST_DATA SpriteArray_NameEntryCursor[];
extern const u16 * CONST_DATA SpriteArray_NameEntryIcons[];
extern const u16 Sprite_NameEntry_PositionIndicator[];

void UpdateNameEntrySpriteGlow(void);

//! FE8U = 0x0804CCCC
void NameEntrySpriteDraw_Loop(struct NameEntrySpriteDrawProc * proc)
{
    int i;

    int x = (proc->xNew + proc->xCurrent) >> 1;
    int y = (proc->yNew + proc->yCurrent) >> 1;

    proc->xCurrent = x;
    proc->yCurrent = y;

    PutSprite(2, x, y, SpriteArray_NameEntryCursor[proc->cursorKind], 0);
    PutSprite(2, 96 + proc->xPointer, 48, Sprite_NameEntry_PositionIndicator, 0);
    PutSprite(2, 96, 32, Sprite_LinkArena_TeamName, 0);
    PutSprite(4, 80, 32, Sprite_LinkArena_NameBanner, OAM2_LAYER(2));

    for (i = 0; i < 5; i++)
    {
        if ((proc->unk_44 == i) && (i <= 2))
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(4));
        }
        else
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(8));
        }
    }

    UpdateNameEntrySpriteGlow();

    return;
}
