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

void Tactician_DrawCharGrid(struct ProcTactician * proc)
{
    int i, j;

    for (i = 0; i < 5; i++)
    {
        ClearText(Texts_1 + (i + proc->text_idx * 5));
        Text_SetColor(Texts_1 + (i + proc->text_idx * 5), TEXT_COLOR_SYSTEM_WHITE);

        for (j = 0; j < 0xF; j++)
        {
            int idx = SioTacticianIndexMap[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(Texts_1 + (i + proc->text_idx * 5), conf->x);
                Text_DrawString(
                    Texts_1 + (i + proc->text_idx * 5),
                    conf->str[proc->line_idx * 3]
                );
            }
        }

        PutText(
            Texts_1 + (i + proc->text_idx * 5),
            TILEMAP_LOCATED(gBG1TilemapBuffer, 0, i * 2 + 9)
        );
    }
}
