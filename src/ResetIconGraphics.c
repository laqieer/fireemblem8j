#include "global.h"
#include "icon.h"

extern u8 DrawnIconLookupTable[0x380]; /* JP: sizeof drives CpuFill16 count 0x1C0 */
extern u8 IconGFXIDLookupTable[];

void ResetIconGraphics(void)
{
    CpuFill16(0, &DrawnIconLookupTable, sizeof(DrawnIconLookupTable));
    CpuFill16(0, &IconGFXIDLookupTable, 0x20);
}
