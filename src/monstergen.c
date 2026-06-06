#include "global.h"

#include "rng.h"

#include "monstergen.h"

int GenerateMonsterClass(u8 baseClassId) {
    const struct MonsterClassWeights *weights = gMonsterClassWeights + baseClassId;
    u8 selected = SelectFromWeightedArray(weights->weights, 5);
    return weights->classes[selected];
}
