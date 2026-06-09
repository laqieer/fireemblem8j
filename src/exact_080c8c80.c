#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

//! FE8U = 0x080C3EC8
void GMapBaseMenu_Init(struct GMapBaseMenuProc * proc)
{
    proc->unk_2a = 0;
    proc->unk_2b = 0;
    proc->pid = -1;
    return;
}
