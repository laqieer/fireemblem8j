#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "cp_utility.h"

//! FE8U = 0x0803B718
s8 AiFindBestAdjacentPositionByFunc(int x, int y, u8(*funcArg)(int x, int y), struct Vec2* out) {
    int i;

    u8(*func)(int x, int y) = funcArg;

    u8 best = 0xff;

    s8 adjacencyLut[8] = {
        +1,  0,
        -1,  0,
         0, +1,
         0, -1,
    };

    for (i = 0; i < 4; i++) {
        u8 val = func(x + adjacencyLut[i * 2 + 0], y + adjacencyLut[i * 2 + 1]);

        if (val == 0xFF) {
            continue;
        }

        if (best <= val) {
            continue;
        }

        best = val;
        out->x = x + adjacencyLut[i * 2 + 0];
        out->y = y + adjacencyLut[i * 2 + 1];
    }

    if (best != 0xFF) {
        return 1;
    }

    return 0;
}
