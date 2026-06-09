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









/* prototypes for same-file helpers called by this run */
const struct TacticianTextConf * GetTacticianTextConf(s16 idx);

void Tactician_MapNameToConfIndices(struct ProcTactician * proc, u8 * str_buf)
{
    int i;
    int j;
    int k;

    int idx = 0;

    for (; *str_buf != 0 ; str_buf += 2)
    {
        for (i = 0; i <= 0x50; i++)
        {
            const struct TacticianTextConf * conf = GetTacticianTextConf(i);

            for (j = 0; j < 3; j++)
            {
                for (k = 0; k < 3; k++)
                {
                    u16 * str = (u16 *)(conf->str + j * 3)[k];

                    if (*str == *(u16 *)str_buf)
                    {
                        proc->unk4C[idx] = ((j & 3) << 0xe) | (i & 0x3FFF);
                        proc->unk39 = k;

                        idx++;

                        goto _080445F8;
                    }
                }
            }
        }

    _080445F8:
        // need a semi-colon for modern compilers
        ; // exit loop
    }

    return;
}
