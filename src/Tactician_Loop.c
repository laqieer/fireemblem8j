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

//! FE8U = 0x08044E74
void Tactician_Loop(struct ProcTactician * proc)
{
    char _cbuf[2 * proc->max_len + 1];
    const struct TacticianTextConf * conf = GetTacticianTextConf(proc->conf_idx);
    proc->conf_idx_bak = proc->conf_idx;

    Tactician_LoopCore(proc, conf);
    if (proc->conf_idx_bak != proc->conf_idx)
    {
        SioPlaySoundEffect(3);
    }

    conf = GetTacticianTextConf(proc->conf_idx);
    SioStrCpy(proc->str, _cbuf);

    _cbuf[2 * proc->max_len - 2] = 0;

    UpdateNameEntrySpriteDraw(proc->child1, conf->x - 4, conf->y + 1, StrLen(_cbuf) * 9, conf->kind, (proc->line_idx <= 1) ? proc->line_idx : 2);
}
