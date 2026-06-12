#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void efxWeaponIcon_Loop(struct ProcEfxWeaponIcon *proc)
{
    int ret;

    if (true == proc->invalid)
        return;
    
    ResetIconGraphics_();
    ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_lut);
    if (ret >= 0)
        proc->unk4C = ret;

    if (proc->eff1 != 0) {
        LoadIconPalette(0, 0x1D);
        EfxPalWhiteInOut(PAL_BG(0), 0x1D, 0x1, proc->unk4C);
    }

    if (proc->eff2 != 0) {
        LoadIconPalette(0, 0x1E);
        EfxPalWhiteInOut(PAL_BG(0), 0x1E, 0x1, proc->unk4C);
    }

    EnablePaletteSync();
}
