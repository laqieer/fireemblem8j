#include "global.h"
#include "classdisplayfont.h"
#include "bmlib.h"
#include "hardware.h"
#include "variables.h"

/* Local struct (subset of ProcPromoSel) to avoid header sig conflict on class_id type. */
struct LoadClassReelProc
{
    u8 _pad00[0x44];
    u16 u44;
    u8 u46;
    u8 u47;
};

struct ClassRollEnt
{
    u8 name[0x14];
};

extern const struct ClassRollEnt gClassReelNameTable[];

void LoadClassReelFontPalette(struct LoadClassReelProc *proc, u16 classId)
{
    int i;
    const u8 *str;
    struct ClassDisplayFont *res;
    u8 *u46ptr;
    const struct ClassRollEnt *table;

    proc->u44 = 0;
    u46ptr = &proc->u46;
    *u46ptr = 0;
    proc->u47 = 0x78;
    i = 0;
    table = gClassReelNameTable;
    str = table[classId].name;
    if (str[0] != 0)
    {
        const u8 *p = str;
        do
        {
            res = GetClassDisplayFontInfo(*p);
            *u46ptr = *u46ptr + (res->width - res->xBase);
            p++;
            i++;
            if (i > 0x13)
                break;
        }
        while ((*p) != 0);
    }
    Decompress(gUnkData_94, (void *)0x06011000);
    CopyToPaletteBuffer(gUnkData_95, 0xa0 << 2, 0x40);
}
