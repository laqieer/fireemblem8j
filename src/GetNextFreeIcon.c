#include "global.h"
#include "icon.h"
#include "hardware.h"

#define MAX_ICON_GFX_COUNT 32
extern u8 IconGFXIDLookupTable[MAX_ICON_GFX_COUNT];

//! FE8U
int GetNextFreeIcon() // Unused
{ 
    int retVal = 0;
    int i;
    for(i = MAX_ICON_GFX_COUNT-1; i >= 0; i--)
    {
        if(IconGFXIDLookupTable[i] != 0) retVal++;
    }
    return retVal;
}
