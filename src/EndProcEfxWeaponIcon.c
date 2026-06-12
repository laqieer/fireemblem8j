#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void EndProcEfxWeaponIcon(void)
{
    if (gpProcEfxWeaponIcon != NULL) {
        Proc_End(gpProcEfxWeaponIcon);
        gpProcEfxWeaponIcon = NULL;
    }
}
