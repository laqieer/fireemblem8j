#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"





void DisableEfxWeaponIcon(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->invalid = true;
}

void EnableEfxWeaponIcon(void)
{
#if BUGFIX
    if (!gpProcEfxWeaponIcon)
        return;
#endif

    gpProcEfxWeaponIcon->invalid = false;
}
