#include "global.h"
#include "gbafe.h"




void EkrDemonkingObj_DissolveLoop(struct Proc08801840 *proc)
{
    int i = 0;
    for (i = 0; i < 6; i++)
        EkrDemonkingObj_SetTilePixel((void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20, gEkrdragonDemonkingobj_3[i][proc->timer]);

    if (proc->timer > 0x3E)
        Proc_Break(proc);
    else {
        proc->timer++;

        for (i = 0; i < 6; i++)
            EkrDemonkingObj_SetTilePixel((void *)0x6002000 + ((proc->ref + i * 0x10) & 0x3FF) * 0x20, gEkrdragonDemonkingobj_3[i][proc->timer]);

        if (proc->timer > 0x3E)
            Proc_Break(proc);
        else
            proc->timer++;
    }
}
