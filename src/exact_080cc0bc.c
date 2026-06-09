#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

void Proc08AA6D04Main(void)
{
    gOpAnimSt.unk08 = gOpAnimSt.y;
    gOpAnimSt.unk0A = gOpAnimSt.unk06;
}
