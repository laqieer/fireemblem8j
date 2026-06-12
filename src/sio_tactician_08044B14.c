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

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

/* prototypes for same-file helpers called by this run */
const struct TacticianTextConf * GetTacticianTextConf(s16 idx);
void TacticianDrawCharacters(struct ProcTactician * proc);
void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);

bool Tactician_TryChangeLastCharVariant(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d)
{
    if (proc->line_idx > 1 && d == 0)
    {
        SioPlaySoundEffect(2);
        TacticianTryAppendChar(proc, conf);
        return false;
    }

    if (proc->cur_len != 0)
    {
        const struct TacticianTextConf * conf2;
        int r8, line_idx;
        u16 conf_idx;

        if (0x3FFF & proc->unk4C[proc->cur_len / 2])
            r8 = 0;
        else
            r8 = 1;

        conf_idx = 0x3FFF & proc->unk4C[proc->cur_len / 2 - r8];
        conf2 = GetTacticianTextConf(conf_idx);
        line_idx = proc->unk4C[proc->cur_len / 2 - r8] >> 14;

        if (*conf2->str[line_idx * 3 + c] != '\0')
        {
            SioPlaySoundEffect(2);
            SioStrCpy(conf2->str[line_idx * 3 + c], &proc->str[proc->cur_len] - r8 * 2);
            TacticianDrawCharacters(proc);
            proc->unk39 = c;
            return true;
        }
        else if (d == 0)
            SioPlaySoundEffect(0);
    }
    else if (d == 0)
        SioPlaySoundEffect(0);

    return false;
}
