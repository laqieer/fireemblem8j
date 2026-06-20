#include "global.h"

#include "bmmap.h"
#include "ekrbattle.h"
#include "bmtrick.h"

void TriggerMapChanges(u16 id, s8 flag, ProcPtr parent)
{
    int f = flag;
    int * new_var;

    if (IsMapChangeEnabled(id))
        return;
    if (f == 1)
        RenderBmMapOnBg2();
    ApplyMapChangesById(id);
    new_var = &f;
    EnableMapChange(id);
    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();
    if ((*new_var) == 1)
        MakeNew6CBMXFADE2(1, parent);
}
