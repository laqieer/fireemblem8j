#include "global.h"

#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

/* file-scope type definitions used by this run */


union Unk_80A6FBC {
    struct __attribute__((packed, aligned(2))) Unk_80A6FBC_pat1 {
        u8 unk0_0 : 1;
        u8 unk0_1 : 6;
        u8 unk0_7 : 1;
        u8 unk1;
    } pat1;
    u16 pat2;
};

//! FE8U = 0x080A6F50
void WriteWorldMapUnits(struct GMapData* pGMapData, u16* param_2) {
    int i;
    union Unk_80A6FBC unaff_r5;

    for (i = 0; i < 7; i++) {
        unaff_r5.pat1.unk0_0 = pGMapData->units[i].state & 1;
        unaff_r5.pat1.unk0_1 = pGMapData->units[i].location;
        unaff_r5.pat1.unk0_7 = (pGMapData->units[i].state >> 1) & 1;
        unaff_r5.pat1.unk1 = pGMapData->units[i].id;
        {
            union Unk_80A6FBC *ptr = &unaff_r5;
            param_2[i] = ptr->pat2;
        }
    }

    return;
}

//! FE8U = 0x080A6FBC
void ReadWorldMapUnits(struct GMapData* param_1, u16* param_2) {
    int i;

    for (i = 0; i < 7; i++) {
        union Unk_80A6FBC sp;
        union Unk_80A6FBC *ptr = &sp;

        ptr->pat2 = param_2[i];

        if (sp.pat1.unk0_0) {
            param_1->units[i].state |= 1;
        } else {
            param_1->units[i].state &= ~1;
        }

        param_1->units[i].location = sp.pat1.unk0_1;

        if (sp.pat1.unk0_7) {
            param_1->units[i].id = sp.pat1.unk1;
            param_1->units[i].state |= 2;
        } else {
            param_1->units[i].id = sp.pat1.unk1;
            param_1->units[i].state &= ~2;
        }
    }

    return;
}
