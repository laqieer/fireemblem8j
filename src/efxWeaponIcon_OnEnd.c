#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void efxWeaponIcon_OnEnd(struct ProcEfxWeaponIcon *proc)
{
    ResetIconGraphics_();

    if (proc->eff1 != 0)
        LoadIconPalette(0, 0x1D);
    
    if (proc->eff2 != 0)
        LoadIconPalette(0, 0x1E);
    
    EnablePaletteSync();
}
