#include "global.h"
#include "hardware.h"
#include "savemenu.h"

//! FE8U = 0x08086928
void StartSaveMenuPostChapter(ProcPtr proc)
{
    Make6C_SaveMenuPostChapter(proc);
    return;
}
