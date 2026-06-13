#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

void TacticianDrawCharacters(struct ProcTactician * proc)
{
    int x;
    struct Text * text;
    const char * str = proc->str;

    ClearText(&Text_0);

    if (*str != '\0')
    {
        text = &Text_0;
        x = 0;
    
        while (*str != '\0')
        {
            Text_SetCursor(text, x);
            str = Text_DrawCharacter(text, str);
            x = x + 9;
        }
    }
    PutText(&Text_0, TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 5));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
