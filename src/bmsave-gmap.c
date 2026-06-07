#include "global.h"

#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

//! FE8U = 0x080A6E24
void ReadWorldMapNodes(struct GMapData* pGMapData, u8* nodeFlags) {
    int i;
    int j;

    int count = 0;

    for (i = 0; i < 0x1d; i++) {
        for (j = 0; j < 2; j++) {
            int idx = count / 8;
            u8 bit = 1 << (count & 7);

            switch (j) {
                case 0:
                    if (nodeFlags[idx] & bit) {
                        pGMapData->nodes[i].state |= 1;
                    } else {
                        pGMapData->nodes[i].state &= ~1;
                    }
                    break;

                case 1:
                    if (nodeFlags[idx] & bit) {
                        pGMapData->nodes[i].state |= 2;
                    } else {
                        pGMapData->nodes[i].state &= ~2;
                    }
                    break;
            }

            count++;
        }
    }

    return;
}
