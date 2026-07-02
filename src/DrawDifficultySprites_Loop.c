#include "global.h"

#include "ctc.h"
#include "savemenu.h"

extern const u16 gSprite_DifficultyMenuSelectModeBg[];

//! FE8U = 0x080AC588
void DrawDifficultySprites_Loop(struct DifficultyMenuSpritesProc * proc)
{
    int i;

    proc->unk_2a++;

    PutSpriteExt(4, 56, 4, gSprite_DifficultyMenuSelectModeBg, OAM2_PAL(2));
    PutSpriteExt(4, 56, 4, gSprite_DifficultyMenuSelectModeText, OAM2_PAL(4));

    for (i = 0; i < 3; i++)
    {
        s16 x = 8; // ?
        s16 y = 48 + i * 32;

        if (i == proc->current_selection)
        {
            PutSpriteExt(4, x, y, gSprite_Difficultymenu_1, OAM2_PAL(5 + (i * 2)));
        }
        else
        {
            PutSpriteExt(4, x, y, gSprite_Difficultymenu_1, OAM2_PAL(6 + (i * 2)));
        }

        PutSpriteExt(4, x, y, gSpriteArray_Difficultymenu_0[i], OAM2_PAL(4));
    }

    DifficultyMenu_UpdateModePalettes(proc->unk_2a, proc->current_selection);
    DrawDifficultyMenuCursorMaybe(proc);

    return;
}
