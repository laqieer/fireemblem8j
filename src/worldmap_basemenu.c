#include "global.h"

#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"

#include "worldmap.h"

//! FE8U = 0x080C3F88
void GMapBaseMenu_StartArmory(struct GMapBaseMenuProc * proc)
{
    StartArmoryScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].armory, proc);
    return;
}

//! FE8U = 0x080C3FB4
void GMapBaseMenu_StartVendor(struct GMapBaseMenuProc * proc)
{
    StartVendorScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].vendor, proc);
    return;
}

//! FE8U = 0x080C3FE0
void GMapBaseMenu_StartSecretShop(struct GMapBaseMenuProc * proc)
{
    StartSecretShopScreen(GetUnitFromCharId(proc->pid), gGMData.units[0].location[gWMNodeData].secretShop, proc);
    return;
}
