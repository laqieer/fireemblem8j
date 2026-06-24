#include "global.h"

#include "rng.h"

#include "monstergen.h"

int GenerateMonsterLevel(u8 baseLevel) {
    s8 result = baseLevel;
    u8 selected = SelectFromWeightedArray(gMonsterLevelWeights, 7);
    result += selected - 2;
    if (result <= 0) {
        result = 1;
    }
    if (result > 20) {
        result = 20;
    }
    return (u8) result;
}
