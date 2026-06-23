#include "global.h"
#include "bmunit.h"
#include "worldmap.h"

s8 GmMuPrim_TrackMovementDelta(struct GMapMuPrimProc * proc)
{
    int i;
    u16 x1;
    u16 y1;
    s16 x2;
    s16 y2;

    MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, &x1, &y1);

    x2 = x1 - proc->unk_44;
    y2 = y1 - proc->unk_46;

    if ((x2 != 0) || (y2 != 0))
    {
        if (proc->unk_40 >= 3)
        {
            for (i = 0; i < 2; i++)
            {
                proc->unk_34[i].a = proc->unk_34[i + 1].a;
                proc->unk_34[i].b = proc->unk_34[i + 1].b;
            }

            proc->unk_34[2].a = x2;
            proc->unk_34[2].b = y2;
        }
        else
        {
            proc->unk_34[proc->unk_40].a = x2;
            proc->unk_34[proc->unk_40].b = y2;
            proc->unk_40++;
        }

        return 1;
    }

    return 0;
}
