#include "global.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "worldmap.h"

//! FE8U = 0x080C3F24
void GMapBaseMenu_ShopFromItemScreen(struct GMapBaseMenuProc * proc)
{
    switch (proc->kind)
    {
        case SHOP_TYPE_ARMORY:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 1);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case SHOP_TYPE_VENDOR:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 2);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        case SHOP_TYPE_SECRET_SHOP:
            if (proc->pid != 0)
            {
                Proc_Goto(proc, 3);
                return;
            }

            Proc_Goto(proc, 5);

            break;

        default:
            Proc_Goto(proc, 5);
            return;
    }

    return;
}
