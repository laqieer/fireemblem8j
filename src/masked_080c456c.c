#include "global.h"

#include "hardware.h"

#include "worldmap.h"

struct GmapPalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 38 */ u16 * unk_38;
    /* 3C */ u16 * unk_3c;
    /* 40 */ u16 * unk_40;
};

struct GmPalFadeInput
{
    /* 00 */ u16 * unk_00;
    /* 04 */ u16 * unk_04;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0C */ int unk_0c;
};

extern u16 gWorldmapGmap_2[];
extern u16 gWorldmapGmap_1[];

/* prototypes for same-file helpers called by this run */
ProcPtr StartGmPalFade(ProcPtr parent, struct GmPalFadeInput * input);

//! FE8U = 0x080BF788
ProcPtr StartGmPalFade_(ProcPtr parent, int unk)
{
    struct GmPalFadeInput input;

    input.unk_00 = gWorldmapGmap_2;
    input.unk_04 = gWorldmapGmap_1;
    input.unk_09 = 144;
    input.unk_08 = 64;
    input.unk_0c = unk;

    return StartGmPalFade(parent, &input);
}
