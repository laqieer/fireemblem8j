#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "classdisplayfont.h"
#include "opinfo.h"

extern u8 gUnkData_94[];
extern u8 gUnkData_95[];

#define UNK30 (*(struct OpInfoClassDisplayProc * volatile *)&proc->unk_30)

void ClassStatsDisplay_Init(struct OpInfoGaugeDrawProc* proc)
{
    struct ClassDisplayFont* res;
    int i;

    proc->unk_30 = proc->proc_parent;
    proc->unk_2a = 0;
    proc->unk_34 = 0;
    proc->unk_35 = 100;

    for (i = 0; ((u8*)UNK30->classReelEnt->descTextId)[i] != 0; )
    {
        res = GetClassDisplayFontInfo(((u8*)UNK30->classReelEnt->descTextId)[i]);
        proc->unk_34 += res->width - res->xBase;
        i++;
        if (i > 13)
            break;
    }

    Decompress(gUnkData_94, (void *)0x06010000);
    ApplyPalettes(gUnkData_95, 0x14, 2);
}
