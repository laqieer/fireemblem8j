#include "gbafe.h"

void EkrWhiteINOUT_RefrainPalette(struct ProcEkrDragonScreenFlashing * proc)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = true;
    gLCDControlBuffer.bldcnt.target2_bd_on = true;
    EnablePaletteSync();
    Proc_Break(proc);
}
