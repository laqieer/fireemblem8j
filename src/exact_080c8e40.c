#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

/* prototypes for same-file helpers called by this run */
struct GMapBaseMenuProc * FindGMapBaseMenu(void);

//! FE8U = 0x080C4088
int GetGMapBaseMenuPid(void)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        return proc->pid;
    }

    return 0;
}

//! FE8U = 0x080C409C
void SetGMapBaseMenuPid(int pid)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        proc->pid = pid;
    }

    return;
}
