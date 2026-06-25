#include "global.h"

#include "bmlib.h"
#include "proc.h"

// JP-area augury palette-fade leaf. Field offsets from gbadisasm oracle.
struct AuguryPalProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3B);
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
};

extern void sub_8000D68(const void * src, int dest, int size);

struct PalLut4
{
    const void * e[4];
};

extern const struct PalLut4 sPalLut_081F5664;

void sub_80A33E0(struct AuguryPalProc * proc)
{
    struct PalLut4 palLut;
    int idx = 0;

    palLut = sPalLut_081F5664;

    if (proc->unk_3d != 0)
    {
        idx = 1;
    }
    else
    {
        switch (proc->unk_3c)
        {
        case 1:
            break;
        case 0:
            idx = 3;
            break;
        case 2:
            idx = 2;
            break;
        }
    }

    sub_8000D68(palLut.e[idx], 0xA0, 0x20);

    if (proc->unk_3b == 0)
    {
        ArchivePalette(0x20);
        SetPalFadeStClkEnd(0xC0, 0xC0, 0xC0);
    }
}
