#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void EndProc08AA6D04(void);

//! FE8U = 0x080CBD7C
void OpAnimEnd(struct ProcOpAnim * proc)
{
    EndAllProcChildren(proc);
    EndProc08AA6D04();
    SetPrimaryHBlankHandler(NULL);
    EndOpAnimfxTerminator();

    gLCDControlBuffer.dispcnt.obj1dMap = 0;

    gPaletteBuffer[0] = gOpAnimSt.pal;
    EnablePaletteSync();

    SetDispEnable(0, 0, 0, 0, 0);

    return;
}
