#include "global.h"

#include "bmmap.h"
#include "ekrbattle.h"
#include "bmtrick.h"

void UntriggerMapChange(u16 id, s8 flag, ProcPtr parent)
{
    int f = flag;
    int * new_var;

    if (IsMapChangeEnabled(id) != 1)
        return;
    if (f == 1)
        RenderBmMapOnBg2();
    RevertMapChange(id);
    new_var = &f;
    DisableMapChange(id);
    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();
    if ((*new_var) == 1)
        MakeNew6CBMXFADE2(1, parent);
}
