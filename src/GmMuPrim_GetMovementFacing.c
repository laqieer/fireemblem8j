#include "global.h"
#include "worldmap.h"

int GmMuPrim_GetMovementFacing(struct GMapMuPrimProc * proc)
{
    u32 unk;
    int i;

    s16 b = 0;
    s16 a = 0;

    for (i = 0; i < proc->unk_40; i++)
    {
        a += proc->unk_34[i].a;
        b += proc->unk_34[i].b;

        unk = GetWMPointDistance(0, 0, a, b, 8);

        if (unk > 35)
        {
            return GmMuPrim_GetFacingFromAngle(ArcTan2(a, b));
        }
    }

    return -1;
}
