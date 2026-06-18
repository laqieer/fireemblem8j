#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"

void SetPrepScreenMenuPosition(int x, int y)
{
    int i;
    struct ProcPrepMenuItem * cmd;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        proc->xPos = x;
        proc->yPos = y;

        if (proc->max_index > 1)
        {
            for (i = 0; i < proc->max_index; i++)
            {
                cmd = proc->cmds[i];
                ClearText(&cmd->text);

                PutDrawText(
                    &cmd->text, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y + 2 * i + 1), 1 & cmd->color, 0, 0,
                    GetStringFromIndex(cmd->msg));
            }
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }
}
