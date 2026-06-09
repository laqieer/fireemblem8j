#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

void OpAnimHBlank1(void)
{
    u16 vcount = REG_VCOUNT;
    u16 _vcount = vcount - 1;

    if (_vcount > 0x9F)
    {
        REG_BG2CNT = (REG_BG2CNT & 0xC0FF) | 0x1E00;
        REG_BLDCNT = 0xC46;
    }

    if (vcount == gOpAnimSt.unk08 || gOpAnimSt.unk08 == 0)
    {
        REG_BG2CNT = (REG_BG2CNT & 0xC0FF) | 0x1D00;
        REG_BLDCNT = 0xC42;
    }
}

void OpAnimHBlank2(void)
{
    u16 vcount = REG_VCOUNT;
    u16 _vcount = vcount - 1;

    if (_vcount > 0x9F)
        REG_BLDCNT = 0xC46;

    if (vcount == gOpAnimSt.unk0A)
        REG_BLDCNT = 0xCCF;
}
