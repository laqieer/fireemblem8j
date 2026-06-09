#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

/* prototypes for same-file helpers called by this run */
struct GMapBaseMenuProc * FindGMapBaseMenu(void);

//! FE8U = 0x080C4070
int GetGMapBaseMenuKind(void)
{
    struct GMapBaseMenuProc * proc = FindGMapBaseMenu();

    if (proc != NULL)
    {
        return proc->kind;
    }

    return 0;
}
