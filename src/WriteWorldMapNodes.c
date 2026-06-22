#include "global.h"
#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

void WriteWorldMapNodes(struct GMapData* pGMapData, u8* nodeFlags) {
    int i;
    int j;
    int count;

    for (i = 0; i < 8; i++) {
        nodeFlags[i] = 0;
    }

    count = 0;

    for (i = 0; i < 0x1d; i++) {
        for (j = 0; j < 2; j++) {
            int r3;

            switch (j) {
                case 0:
                    r3 = pGMapData->nodes[i].state & 1;
                    break;

                case 1:
                    r3 = (s8)(pGMapData->nodes[i].state & 2);
                    break;
            }

            if (r3 != 0) {
                int idx = count / 8;
                int bit = count & 7;

                nodeFlags[idx] |= (1 << bit);
            }

            count++;
        }
    }
}
