typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;
typedef int s32;

struct Vec2 { s16 x, y; };
struct SumThing {
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

struct Unit;

extern struct Vec2 gBmMapSize;
extern u8 ** gBmMapUnit;
extern u8 ** gBmMapTerrain;
extern u8 ** gBmMapFog;
extern struct { u8 pad[0xd]; u8 chapterVisionRange; } gPlaySt;

extern int AdvanceGetLCGRNValue(void);
extern int DivRem(int, int);
extern int CanUnitCrossTerrain(struct Unit* unit, int terrain);
extern struct Unit gBattleActorUnit; /* = &gBattleActor.unit @ JP 0x0203A4E8 */

s8 sub_807D3BC(int x, int y, struct SumThing* result)
{
    struct SumThing array[9];
    u8 sel[9];
    int count = 0;
    s8 iy, ix;
    s8 j, k;

    for (iy = y - 1; iy < y + 2; ++iy) {
        for (ix = x - 1; ix < x + 2; ++ix) {
            array[count].x = ix;
            array[count].y = iy;

            if (iy >= gBmMapSize.y)
                goto skip;
            if (ix >= gBmMapSize.x)
                goto skip;
            if (iy < 0)
                goto skip;
            if (ix < 0)
                goto skip;
            if (gBmMapUnit[iy][ix] != 0)
                goto skip;
            if (gPlaySt.chapterVisionRange && gBmMapFog[iy][ix] == 0)
                goto skip;
            if (CanUnitCrossTerrain(&gBattleActorUnit, gBmMapTerrain[iy][ix]) != 0) {
                array[count].boolAvailable = 1;
                count++;
                continue;
            }
        skip:
            array[count].boolAvailable |= 0xff;
        }
    }

    if (count == 0)
        return -1;

    for (k = 8; k >= 0; --k)
        sel[k] = 0;

    k = 0;
    for (j = 0; j < count; ++j) {
        if (array[j].boolAvailable == 1) {
            sel[k] = j;
            k++;
        }
    }

    *result = array[sel[DivRem(AdvanceGetLCGRNValue(), count + 1) - 1]];
    return 1;
}