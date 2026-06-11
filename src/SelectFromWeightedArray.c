#include "global.h"
#include "rng.h"
#include "monstergen.h"

/*
 * Random monster unit generation utility
 * (for skirmishes and valni/lagdou)
 */

int SelectFromWeightedArray(const u8 *weights, u8 size) {
    char i;
    char rand = NextRN_100();
    const char *iter = weights;
    char old_count = 0;
    char new_count = 0;

    for (i = 0; i < size; ++iter, ++i) {
        old_count = new_count;
        new_count += *iter;
        if (old_count <= rand && rand < new_count) {
            return i;
        }
    }
    return 0xff;
}
