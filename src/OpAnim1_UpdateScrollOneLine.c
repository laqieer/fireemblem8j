#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

void OpAnim1_UpdateScrollOneLine(s16 index)
{
    int i;
    int _index;
    u16 * tsa, * vram = (void *)BG_VRAM + 0xE800;

    _index = index;
    if (index < 0 || index > 99)
        return;

    vram = ((~_index & 0x1F) << 6) + (void *)vram;
    _index = (s16)(99 - _index);

    Decompress(imgs_Opanim_0[_index], (void *)BG_VRAM + 0x8000 + 0x400 * DivRem(_index, 0x16));

    tsa = tsas_Opanim_0[_index];
    for (i = 0; i < 0x1E;)
    {
        *vram = (*tsa & 0xFC00) | (32 * DivRem(_index, 0x16) + i);
        i++;
        vram++;
        tsa++;
    }
}
