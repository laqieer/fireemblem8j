#include "global.h"
#include "mu.h"
#include "proc.h"

void SortMus(void)
{
    struct MuProc * procs[MU_MAX_COUNT];

    s8 i, j, count;

    // Clear proc list
    CpuFill32(0, procs, MU_MAX_COUNT * sizeof(struct MuProc *));
    count = 0;

    // Building proc list
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);

        if (proc)
        {
            procs[count] = proc;
            count++;
        }
    }

    // Sorting proc list
    for (i = 0; i < (count - 1); ++i)
    {
        for (j = (i + 1); j < count; ++j)
        {
            if (procs[j]->y_q4 < procs[i]->y_q4)
            {
                struct MuProc * tmp = procs[i];

                procs[i] = procs[j];
                procs[j] = tmp;
            }
        }
    }

    // Set obj layer based on order
    for (i = 0; i < count; ++i)
        procs[i]->sprite_anim->objLayer = 10 - i;
}
