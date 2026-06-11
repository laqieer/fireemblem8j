#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080C85FC
void OpAnimRestoreColorEffectsOnEnd(void)
{
    SetDefaultColorEffects();
    return;
}
