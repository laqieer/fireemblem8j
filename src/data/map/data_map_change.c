#include "global.h"

/* Map-change / tile-change tables, one per map. Ported from
 * fireemblem8u src/data/map/data_map_change.s into typed C. The whole
 * region is one TU so the in-table pointers resolve to the contiguous
 * JP addresses at link time (placed at JP 0x08A9B024). Region-different
 * from fe8u only in pointer relocations + a single tile id; see
 * scripts/gen_data_map_change.py JP_FIXUPS. */

static const struct MapChange PrologueMapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange Ch1MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch2TileChanges_change_0[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch2TileChanges_change_1[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch2TileChanges_change_2[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch2TileChanges_change_3[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch2TileChanges_change_4[] = { 0x0080 };
static const u16 Ch2TileChanges_change_5[] = { 0x0080 };
static const u16 Ch2TileChanges_change_6[] = { 0x0080 };
static const u16 Ch2TileChanges_change_7[] = { 0x0080 };
static const struct MapChange Ch2TileChanges[] = {
    { 0, 3, 0, 3, 3, Ch2TileChanges_change_0 },
    { 1, 6, 0, 3, 3, Ch2TileChanges_change_1 },
    { 2, 11, 1, 3, 3, Ch2TileChanges_change_2 },
    { 3, 0, 10, 3, 3, Ch2TileChanges_change_3 },
    { 4, 4, 2, 1, 1, Ch2TileChanges_change_4 },
    { 5, 7, 2, 1, 1, Ch2TileChanges_change_5 },
    { 6, 12, 3, 1, 1, Ch2TileChanges_change_6 },
    { 7, 1, 12, 1, 1, Ch2TileChanges_change_7 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch3MapChanges_change_0[] = { 0x0A38, 0x0000, 0x0690, 0x0710 };
static const u16 Ch3MapChanges_change_1[] = { 0x0A38, 0x0000, 0x0690, 0x0710 };
static const u16 Ch3MapChanges_change_2[] = { 0x0A38, 0x0000, 0x0690, 0x0838 };
static const u16 Ch3MapChanges_change_3[] = { 0x08BC, 0x0934 };
static const u16 Ch3MapChanges_change_4[] = { 0x0718 };
static const u16 Ch3MapChanges_change_5[] = { 0x08BC };
static const u16 Ch3MapChanges_change_6[] = { 0x0100 };
static const u16 Ch3MapChanges_change_7[] = { 0x0100 };
static const u16 Ch3MapChanges_change_8[] = { 0x0100 };
static const u16 Ch3MapChanges_change_9[] = { 0x0100 };
static const struct MapChange Ch3MapChanges[] = {
    { 0, 4, 8, 2, 2, Ch3MapChanges_change_0 },
    { 1, 4, 11, 2, 2, Ch3MapChanges_change_1 },
    { 2, 8, 7, 2, 2, Ch3MapChanges_change_2 },
    { 3, 2, 3, 1, 2, Ch3MapChanges_change_3 },
    { 4, 6, 10, 1, 1, Ch3MapChanges_change_4 },
    { 5, 10, 5, 1, 1, Ch3MapChanges_change_5 },
    { 6, 6, 3, 1, 1, Ch3MapChanges_change_6 },
    { 7, 8, 3, 1, 1, Ch3MapChanges_change_7 },
    { 8, 10, 3, 1, 1, Ch3MapChanges_change_8 },
    { 9, 6, 12, 1, 1, Ch3MapChanges_change_9 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch4MapChanges_change_0[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch4MapChanges_change_1[] = { 0x001C, 0x0010, 0x002C };
static const u16 Ch4MapChanges_change_2[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch4MapChanges_change_3[] = { 0x0080 };
static const u16 Ch4MapChanges_change_4[] = { 0x001C, 0x0010, 0x002C };
static const u16 Ch4MapChanges_change_5[] = { 0x0080 };
static const struct MapChange Ch4MapChanges[] = {
    { 0, 7, 0, 3, 3, Ch4MapChanges_change_0 },
    { 1, 4, 8, 1, 3, Ch4MapChanges_change_1 },
    { 2, 0, 9, 3, 3, Ch4MapChanges_change_2 },
    { 3, 8, 2, 1, 1, Ch4MapChanges_change_3 },
    { 4, 4, 8, 1, 3, Ch4MapChanges_change_4 },
    { 5, 1, 11, 1, 1, Ch4MapChanges_change_5 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch5MapChanges_change_0[] = { 0x0B90, 0x0B94, 0x0C88, 0x0C10, 0x0C14, 0x0D08 };
static const u16 Ch5MapChanges_change_1[] = { 0x0B90, 0x0B94, 0x0C88, 0x0C10, 0x0C14, 0x0D08 };
static const u16 Ch5MapChanges_change_2[] = { 0x0B90, 0x0B94, 0x0C88, 0x0C10, 0x0C14, 0x0D08 };
static const u16 Ch5MapChanges_change_3[] = { 0x0C88, 0x0B94, 0x0B98, 0x0D08, 0x0C14, 0x0C18 };
static const u16 Ch5MapChanges_change_4[] = { 0x0080 };
static const u16 Ch5MapChanges_change_5[] = { 0x0080 };
static const u16 Ch5MapChanges_change_6[] = { 0x0080 };
static const u16 Ch5MapChanges_change_7[] = { 0x0080 };
static const struct MapChange Ch5MapChanges[] = {
    { 0, 4, 0, 3, 2, Ch5MapChanges_change_0 },
    { 1, 4, 5, 3, 2, Ch5MapChanges_change_1 },
    { 2, 11, 9, 3, 2, Ch5MapChanges_change_2 },
    { 3, 11, 18, 3, 2, Ch5MapChanges_change_3 },
    { 4, 5, 1, 1, 1, Ch5MapChanges_change_4 },
    { 5, 5, 6, 1, 1, Ch5MapChanges_change_5 },
    { 6, 12, 10, 1, 1, Ch5MapChanges_change_6 },
    { 7, 12, 19, 1, 1, Ch5MapChanges_change_7 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch5XMapChanges_change_0[] = { 0x0004 };
static const u16 Ch5XMapChanges_change_1[] = { 0x0004 };
static const u16 Ch5XMapChanges_change_2[] = { 0x0CD0 };
static const struct MapChange Ch5XMapChanges[] = {
    { 0, 4, 8, 1, 1, Ch5XMapChanges_change_0 },
    { 1, 5, 8, 1, 1, Ch5XMapChanges_change_1 },
    { 2, 4, 10, 1, 1, Ch5XMapChanges_change_2 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch6MapChanges_change_0[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch6MapChanges_change_1[] = { 0x0080 };
static const struct MapChange Ch6MapChanges[] = {
    { 0, 10, 16, 3, 3, Ch6MapChanges_change_0 },
    { 1, 11, 18, 1, 1, Ch6MapChanges_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange Ch7MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch8MapChanges_change_0[] = { 0x0CD0 };
static const u16 Ch8MapChanges_change_1[] = { 0x0748, 0x0000, 0x07C8, 0x0000, 0x0CE4, 0x0CD4 };
static const u16 Ch8MapChanges_change_2[] = { 0x0CD0 };
static const u16 Ch8MapChanges_change_3[] = { 0x0004 };
static const u16 Ch8MapChanges_change_4[] = { 0x0004 };
static const u16 Ch8MapChanges_change_5[] = { 0x036C, 0x0370, 0x0374, 0x0378, 0x03EC, 0x03F0, 0x03F0, 0x03F8, 0x046C, 0x0470, 0x0474, 0x0478 };
static const u16 Ch8MapChanges_change_6[] = { 0x0004 };
static const struct MapChange Ch8MapChanges[] = {
    { 0, 20, 7, 1, 1, Ch8MapChanges_change_0 },
    { 1, 4, 6, 2, 3, Ch8MapChanges_change_1 },
    { 2, 1, 5, 1, 1, Ch8MapChanges_change_2 },
    { 3, 1, 3, 1, 1, Ch8MapChanges_change_3 },
    { 4, 2, 3, 1, 1, Ch8MapChanges_change_4 },
    { 5, 18, 21, 4, 3, Ch8MapChanges_change_5 },
    { 6, 19, 4, 1, 1, Ch8MapChanges_change_6 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch9EirikaMapChanges_change_0[] = { 0x0B90, 0x0B94, 0x0B98, 0x0C10, 0x0C14, 0x0C18 };
static const u16 Ch9EirikaMapChanges_change_1[] = { 0x0B90, 0x0B94, 0x0B98, 0x0C10, 0x0C14, 0x0C18 };
static const u16 Ch9EirikaMapChanges_change_2[] = { 0x0E04 };
static const u16 Ch9EirikaMapChanges_change_3[] = { 0x0E04 };
static const struct MapChange Ch9EirikaMapChanges[] = {
    { 0, 0, 10, 3, 2, Ch9EirikaMapChanges_change_0 },
    { 1, 10, 14, 3, 2, Ch9EirikaMapChanges_change_1 },
    { 2, 1, 11, 1, 1, Ch9EirikaMapChanges_change_2 },
    { 3, 11, 15, 1, 1, Ch9EirikaMapChanges_change_3 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch10EirikaMapChanges_change_0[] = { 0x0B68, 0x0B4C };
static const u16 Ch10EirikaMapChanges_change_1[] = { 0x0D98 };
static const u16 Ch10EirikaMapChanges_change_2[] = { 0x0D98 };
static const u16 Ch10EirikaMapChanges_change_3[] = { 0x0D98 };
static const u16 Ch10EirikaMapChanges_change_4[] = { 0x0D98 };
static const struct MapChange Ch10EirikaMapChanges[] = {
    { 0, 10, 9, 2, 1, Ch10EirikaMapChanges_change_0 },
    { 1, 10, 7, 1, 1, Ch10EirikaMapChanges_change_1 },
    { 2, 11, 6, 1, 1, Ch10EirikaMapChanges_change_2 },
    { 3, 12, 6, 1, 1, Ch10EirikaMapChanges_change_3 },
    { 4, 13, 8, 1, 1, Ch10EirikaMapChanges_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch11EirikaMapChanges_change_0[] = { 0x0104 };
static const u16 Ch11EirikaMapChanges_change_1[] = { 0x0104 };
static const u16 Ch11EirikaMapChanges_change_2[] = { 0x0104 };
static const u16 Ch11EirikaMapChanges_change_3[] = { 0x0BC0 };
static const u16 Ch11EirikaMapChanges_change_4[] = { 0x0BC0, 0x0B44 };
static const struct MapChange Ch11EirikaMapChanges[] = {
    { 0, 3, 8, 1, 1, Ch11EirikaMapChanges_change_0 },
    { 1, 12, 11, 1, 1, Ch11EirikaMapChanges_change_1 },
    { 2, 17, 5, 1, 1, Ch11EirikaMapChanges_change_2 },
    { 3, 4, 11, 1, 1, Ch11EirikaMapChanges_change_3 },
    { 4, 17, 13, 2, 1, Ch11EirikaMapChanges_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch12EirikaMapChanges_change_0[] = { 0x0E18 };
static const u16 Ch12EirikaMapChanges_change_1[] = { 0x0E18 };
static const u16 Ch12EirikaMapChanges_change_2[] = { 0x0C18 };
static const u16 Ch12EirikaMapChanges_change_3[] = { 0x0C18 };
static const struct MapChange Ch12EirikaMapChanges[] = {
    { 0, 6, 10, 1, 1, Ch12EirikaMapChanges_change_0 },
    { 1, 5, 12, 1, 1, Ch12EirikaMapChanges_change_1 },
    { 2, 6, 10, 1, 1, Ch12EirikaMapChanges_change_2 },
    { 3, 5, 12, 1, 1, Ch12EirikaMapChanges_change_3 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange Ch13EirikaMapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch14EirikaMapChanges_change_0[] = { 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x0000, 0x0000, 0x0CE4, 0x0C48, 0x0C48, 0x0C48, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0C44, 0x0C44, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0184, 0x0C40, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0C48, 0x0C44, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0184, 0x0C40, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0C48, 0x0C44, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0C44, 0x0C44, 0x0000, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0CD8, 0x0000, 0x0000 };
static const u16 Ch14EirikaMapChanges_change_1[] = { 0x0804, 0x0C40, 0x0604, 0x0C4C, 0x0C44, 0x0C48, 0x0C40, 0x0C44, 0x0C44, 0x0C40, 0x0C44, 0x0C44, 0x0C40, 0x0C44, 0x0C44, 0x0C40, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0000 };
static const u16 Ch14EirikaMapChanges_change_2[] = { 0x0CD0, 0x0CD8 };
static const u16 Ch14EirikaMapChanges_change_3[] = { 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x0CC8, 0x0C48, 0x0C48, 0x0C48, 0x0C44, 0x0C44, 0x0184, 0x0C40, 0x0C40, 0x0C44, 0x0C48, 0x0C44, 0x0C40, 0x0C44, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0000, 0x0000 };
static const u16 Ch14EirikaMapChanges_change_4[] = { 0x0CD0 };
static const u16 Ch14EirikaMapChanges_change_5[] = { 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x0730, 0x0C4C, 0x0C48, 0x0184, 0x0C4C, 0x0184, 0x0C4C, 0x0C48, 0x0C40, 0x0C44, 0x0C48, 0x0C44, 0x0C48, 0x0C44, 0x0C44, 0x0D48, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0C44, 0x0000, 0x0000, 0x0000, 0x0C40, 0x0000, 0x0000, 0x0000 };
static const u16 Ch14EirikaMapChanges_change_6[] = { 0x06A8, 0x06A8, 0x06A8, 0x06A8, 0x0C4C, 0x0C48, 0x0C48, 0x0C48, 0x0C40, 0x0184, 0x0C40, 0x0C44, 0x0C40, 0x0C48, 0x0C44, 0x0C44, 0x0C40, 0x0C44, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0000, 0x0000 };
static const u16 Ch14EirikaMapChanges_change_7[] = { 0x0104 };
static const u16 Ch14EirikaMapChanges_change_8[] = { 0x0104 };
static const u16 Ch14EirikaMapChanges_change_9[] = { 0x0000, 0x0804, 0x0CD0, 0x0604, 0x08A4, 0x0C4C, 0x0C44, 0x0C48, 0x0CE4, 0x0C44, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0C44, 0x0C44, 0x0000, 0x0C40, 0x0C44, 0x0C44 };
static const u16 Ch14EirikaMapChanges_change_10[] = { 0x0104 };
static const u16 Ch14EirikaMapChanges_change_11[] = { 0x0104 };
static const u16 Ch14EirikaMapChanges_change_12[] = { 0x0104 };
static const u16 Ch14EirikaMapChanges_change_13[] = { 0x0104 };
static const struct MapChange Ch14EirikaMapChanges[] = {
    { 0, 19, 0, 6, 10, Ch14EirikaMapChanges_change_0 },
    { 1, 21, 11, 3, 7, Ch14EirikaMapChanges_change_1 },
    { 2, 17, 2, 2, 1, Ch14EirikaMapChanges_change_2 },
    { 3, 16, 14, 4, 6, Ch14EirikaMapChanges_change_3 },
    { 4, 10, 14, 1, 1, Ch14EirikaMapChanges_change_4 },
    { 5, 6, 19, 7, 6, Ch14EirikaMapChanges_change_5 },
    { 6, 1, 14, 4, 6, Ch14EirikaMapChanges_change_6 },
    { 7, 22, 3, 1, 1, Ch14EirikaMapChanges_change_7 },
    { 8, 22, 5, 1, 1, Ch14EirikaMapChanges_change_8 },
    { 9, 20, 11, 4, 6, Ch14EirikaMapChanges_change_9 },
    { 10, 18, 16, 1, 1, Ch14EirikaMapChanges_change_10 },
    { 11, 8, 20, 1, 1, Ch14EirikaMapChanges_change_11 },
    { 12, 2, 16, 1, 1, Ch14EirikaMapChanges_change_12 },
    { 13, 10, 20, 1, 1, Ch14EirikaMapChanges_change_13 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch15MapChanges_change_0[] = { 0x0EC8, 0x0ECC, 0x0ED0, 0x0F48, 0x0F4C, 0x0F50, 0x0FC8, 0x0FCC, 0x0FD0 };
static const u16 Ch15MapChanges_change_1[] = { 0x0E50 };
static const struct MapChange Ch15MapChanges[] = {
    { 0, 0, 12, 3, 3, Ch15MapChanges_change_0 },
    { 1, 1, 14, 1, 1, Ch15MapChanges_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch16MapChanges_change_0[] = { 0x0740, 0x0C40, 0x0000, 0x0C44 };
static const u16 Ch16MapChanges_change_1[] = { 0x08A4, 0x0C40, 0x07B0, 0x0000, 0x0C44, 0x0000 };
static const u16 Ch16MapChanges_change_2[] = { 0x0004 };
static const u16 Ch16MapChanges_change_3[] = { 0x0004 };
static const u16 Ch16MapChanges_change_4[] = { 0x0004 };
static const u16 Ch16MapChanges_change_5[] = { 0x0C40 };
static const u16 Ch16MapChanges_change_6[] = { 0x0004 };
static const u16 Ch16MapChanges_change_7[] = { 0x0F68, 0x068C };
static const u16 Ch16MapChanges_change_8[] = { 0x0FDC, 0x0000, 0x09C0, 0x0C2C };
static const struct MapChange Ch16MapChanges[] = {
    { 0, 3, 3, 2, 2, Ch16MapChanges_change_0 },
    { 1, 2, 10, 3, 2, Ch16MapChanges_change_1 },
    { 2, 3, 12, 1, 1, Ch16MapChanges_change_2 },
    { 3, 20, 1, 1, 1, Ch16MapChanges_change_3 },
    { 4, 20, 3, 1, 1, Ch16MapChanges_change_4 },
    { 5, 1, 4, 1, 1, Ch16MapChanges_change_5 },
    { 6, 20, 5, 1, 1, Ch16MapChanges_change_6 },
    { 7, 13, 2, 1, 2, Ch16MapChanges_change_7 },
    { 8, 14, 2, 2, 2, Ch16MapChanges_change_8 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch17MapChanges_change_0[] = { 0x001C, 0x009C, 0x002C };
static const u16 Ch17MapChanges_change_1[] = { 0x0110, 0x0094, 0x0114 };
static const u16 Ch17MapChanges_change_2[] = { 0x0E0C };
static const u16 Ch17MapChanges_change_3[] = { 0x0E0C };
static const struct MapChange Ch17MapChanges[] = {
    { 0, 4, 14, 1, 3, Ch17MapChanges_change_0 },
    { 1, 15, 13, 3, 1, Ch17MapChanges_change_1 },
    { 2, 12, 2, 1, 1, Ch17MapChanges_change_2 },
    { 3, 1, 20, 1, 1, Ch17MapChanges_change_3 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange Ch18MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch19MapChanges_change_0[] = { 0x0004 };
static const u16 Ch19MapChanges_change_1[] = { 0x0004 };
static const u16 Ch19MapChanges_change_2[] = { 0x0004 };
static const u16 Ch19MapChanges_change_3[] = { 0x0004 };
static const u16 Ch19MapChanges_change_4[] = { 0x0004 };
static const u16 Ch19MapChanges_change_5[] = { 0x0004 };
static const u16 Ch19MapChanges_change_6[] = { 0x0B40, 0x0B44 };
static const struct MapChange Ch19MapChanges[] = {
    { 0, 2, 11, 1, 1, Ch19MapChanges_change_0 },
    { 1, 3, 12, 1, 1, Ch19MapChanges_change_1 },
    { 2, 4, 11, 1, 1, Ch19MapChanges_change_2 },
    { 3, 27, 10, 1, 1, Ch19MapChanges_change_3 },
    { 4, 27, 12, 1, 1, Ch19MapChanges_change_4 },
    { 5, 27, 14, 1, 1, Ch19MapChanges_change_5 },
    { 6, 3, 15, 1, 2, Ch19MapChanges_change_6 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange Ch20MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 FinalChapterMap1Changes_change_0[] = { 0x0CD4, 0x0C50 };
static const u16 FinalChapterMap1Changes_change_1[] = { 0x0D50, 0x0DD0 };
static const u16 FinalChapterMap1Changes_change_2[] = { 0x0004 };
static const u16 FinalChapterMap1Changes_change_3[] = { 0x0004 };
static const struct MapChange FinalChapterMap1Changes[] = {
    { 0, 4, 19, 1, 2, FinalChapterMap1Changes_change_0 },
    { 1, 18, 19, 1, 2, FinalChapterMap1Changes_change_1 },
    { 2, 21, 18, 1, 1, FinalChapterMap1Changes_change_2 },
    { 3, 2, 18, 1, 1, FinalChapterMap1Changes_change_3 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange FinalChapterMap2Changes[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch9EphMapChanges_change_0[] = { 0x0CD0, 0x0CD4, 0x0CD0, 0x0CD4 };
static const u16 Ch9EphMapChanges_change_1[] = { 0x07A8, 0x0000, 0x0CE4, 0x0CD4 };
static const u16 Ch9EphMapChanges_change_2[] = { 0x0CD0, 0x0CD8 };
static const u16 Ch9EphMapChanges_change_3[] = { 0x0104 };
static const u16 Ch9EphMapChanges_change_4[] = { 0x0104 };
static const u16 Ch9EphMapChanges_change_5[] = { 0x0104 };
static const struct MapChange Ch9EphMapChanges[] = {
    { 0, 12, 17, 2, 2, Ch9EphMapChanges_change_0 },
    { 1, 13, 1, 2, 2, Ch9EphMapChanges_change_1 },
    { 2, 12, 3, 1, 2, Ch9EphMapChanges_change_2 },
    { 3, 7, 1, 1, 1, Ch9EphMapChanges_change_3 },
    { 4, 18, 1, 1, 1, Ch9EphMapChanges_change_4 },
    { 5, 23, 1, 1, 1, Ch9EphMapChanges_change_5 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch10EphraimMapChanges_change_0[] = { 0x0E84, 0x0E88, 0x0E8C, 0x0F04, 0x0F08, 0x0F0C, 0x0F84, 0x0F88, 0x0F8C };
static const u16 Ch10EphraimMapChanges_change_1[] = { 0x0E84, 0x0E88, 0x0E8C, 0x0F04, 0x0F08, 0x0F0C, 0x0F84, 0x0F88, 0x0F8C };
static const u16 Ch10EphraimMapChanges_change_2[] = { 0x0F80 };
static const u16 Ch10EphraimMapChanges_change_3[] = { 0x0F80 };
static const u16 Ch10EphraimMapChanges_change_4[] = { 0x0080 };
static const u16 Ch10EphraimMapChanges_change_5[] = { 0x0080 };
static const u16 Ch10EphraimMapChanges_change_6[] = { 0x0F80 };
static const u16 Ch10EphraimMapChanges_change_7[] = { 0x0F80 };
static const struct MapChange Ch10EphraimMapChanges[] = {
    { 0, 8, 0, 3, 3, Ch10EphraimMapChanges_change_0 },
    { 1, 3, 10, 3, 3, Ch10EphraimMapChanges_change_1 },
    { 2, 5, 1, 1, 1, Ch10EphraimMapChanges_change_2 },
    { 3, 6, 0, 1, 1, Ch10EphraimMapChanges_change_3 },
    { 4, 9, 2, 1, 1, Ch10EphraimMapChanges_change_4 },
    { 5, 4, 12, 1, 1, Ch10EphraimMapChanges_change_5 },
    { 6, 8, 14, 1, 1, Ch10EphraimMapChanges_change_6 },
    { 7, 9, 14, 1, 1, Ch10EphraimMapChanges_change_7 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch11EphraimMapChanges_change_0[] = { 0x0000, 0x0000, 0x086C, 0x0868, 0x0000, 0x0000, 0x0000, 0x0000, 0x0768, 0x064C, 0x0668, 0x0868, 0x0000, 0x0768, 0x07EC, 0x07E8, 0x0378, 0x06E4, 0x07EC, 0x0868, 0x0768, 0x0000, 0x03EC, 0x03F0, 0x03F4, 0x03F8, 0x07EC, 0x0768, 0x0468, 0x046C, 0x0470, 0x0474, 0x0478, 0x047C, 0x0768, 0x04E8, 0x0584, 0x0678, 0x0598, 0x04F8, 0x04FC, 0x0768, 0x03E4, 0x0604, 0x0598, 0x0610, 0x0608, 0x0460, 0x0768, 0x0464, 0x06F4, 0x04F4, 0x04F4, 0x04F4, 0x04E0, 0x0768, 0x0464, 0x06F4, 0x04F4, 0x058C, 0x0678, 0x04E0, 0x0768, 0x0464, 0x06F4, 0x04F4, 0x060C, 0x0674, 0x04E0, 0x0768, 0x0464, 0x06F4, 0x04F4, 0x058C, 0x0678, 0x04E0, 0x0768, 0x0464, 0x06F4, 0x04F4, 0x060C, 0x0674, 0x04E0, 0x0768 };
static const u16 Ch11EphraimMapChanges_change_1[] = { 0x0000, 0x0000, 0x0000, 0x086C, 0x0868, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x086C, 0x064C, 0x0668, 0x0868, 0x0000, 0x0000, 0x076C, 0x08F0, 0x07E8, 0x0378, 0x06E4, 0x07EC, 0x0868, 0x0000, 0x08F0, 0x086C, 0x03EC, 0x03F0, 0x03F4, 0x03F8, 0x07EC, 0x0868, 0x0868, 0x0468, 0x046C, 0x0470, 0x0474, 0x0478, 0x047C, 0x07EC, 0x086C, 0x04E8, 0x0584, 0x0678, 0x0598, 0x04F8, 0x04FC, 0x07EC, 0x076C, 0x03E4, 0x0604, 0x0598, 0x0610, 0x0608, 0x0460, 0x0000, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x04F4, 0x04F4, 0x04E0, 0x0000, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x058C, 0x0678, 0x04E0, 0x07EC, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x060C, 0x0674, 0x04E0, 0x0768, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x058C, 0x0678, 0x04E0, 0x0768, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x060C, 0x0674, 0x04E0, 0x0768, 0x0000, 0x03E4, 0x06F4, 0x0598, 0x0598, 0x04F4, 0x04E0, 0x0768, 0x086C, 0x03E4, 0x05A0, 0x0670, 0x0610, 0x05A0, 0x03E0, 0x0000, 0x0000, 0x04CC, 0x03D0, 0x03D4, 0x0450, 0x0454, 0x054C, 0x0768, 0x0868, 0x05D0, 0x05D4, 0x075C, 0x0760, 0x05E0, 0x05E4, 0x07EC, 0x086C, 0x0650, 0x0654, 0x0658, 0x065C, 0x0660, 0x0664, 0x086C, 0x0000, 0x07EC, 0x06D4, 0x06D8, 0x06DC, 0x06E0, 0x07E8, 0x0000, 0x0000, 0x0000, 0x07EC, 0x0968, 0x0968, 0x07E8, 0x0000, 0x0000 };
static const u16 Ch11EphraimMapChanges_change_2[] = { 0x0618, 0x059C, 0x059C, 0x061C, 0x0618, 0x059C, 0x059C, 0x061C, 0x0000, 0x076C, 0x0000, 0x0464, 0x03E0, 0x0000, 0x0000, 0x03E4, 0x0618, 0x059C, 0x059C, 0x061C };
static const u16 Ch11EphraimMapChanges_change_3[] = { 0x0868, 0x0000, 0x0000, 0x0000, 0x086C, 0x0868, 0x0868, 0x0868, 0x0000, 0x086C, 0x064C, 0x0668, 0x047C, 0x07EC, 0x07E8, 0x086C, 0x0378, 0x06E4, 0x04FC, 0x07EC, 0x07E8, 0x03EC, 0x03F0, 0x03F4, 0x0460, 0x07EC, 0x0468, 0x046C, 0x0470, 0x0474, 0x04E0, 0x0000, 0x04E8, 0x05A0, 0x0578, 0x0598, 0x04E0, 0x0000, 0x0568, 0x06F8, 0x04F4, 0x04F4, 0x04E0, 0x0000, 0x05E8, 0x06F4, 0x04F4, 0x058C, 0x0618, 0x059C, 0x061C, 0x06F4, 0x04F4, 0x060C, 0x04E0, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x058C, 0x04E0, 0x0000, 0x03E4, 0x06F4, 0x04F4, 0x060C, 0x03E0, 0x0000, 0x0464, 0x06F4, 0x04F4, 0x04F4, 0x054C, 0x0000, 0x03E4, 0x05A0, 0x0670, 0x04F4, 0x05E4, 0x07EC, 0x04CC, 0x03D0, 0x0560, 0x055C, 0x0664, 0x07EC, 0x05D0, 0x05D4, 0x05D8, 0x05DC, 0x07E8, 0x0000, 0x0650, 0x0654, 0x0658, 0x065C, 0x0000, 0x0000, 0x07EC, 0x06D4, 0x06D8, 0x06DC };
static const struct MapChange Ch11EphraimMapChanges[] = {
    { 0, 14, 7, 7, 12, Ch11EphraimMapChanges_change_0 },
    { 1, 9, 0, 8, 19, Ch11EphraimMapChanges_change_1 },
    { 2, 7, 7, 4, 5, Ch11EphraimMapChanges_change_2 },
    { 3, 15, 2, 6, 17, Ch11EphraimMapChanges_change_3 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch12EphraimMapChanges_change_0[] = { 0x0B90, 0x0B94, 0x0B84, 0x0C10, 0x0C14, 0x0C04 };
static const u16 Ch12EphraimMapChanges_change_1[] = { 0x0080 };
static const struct MapChange Ch12EphraimMapChanges[] = {
    { 0, 4, 4, 3, 2, Ch12EphraimMapChanges_change_0 },
    { 1, 5, 5, 1, 1, Ch12EphraimMapChanges_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch13EphraimMapChanges_change_0[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch13EphraimMapChanges_change_1[] = { 0x0E1C, 0x0E20, 0x0E24, 0x0E9C, 0x0EA0, 0x0EA4, 0x0F1C, 0x0F20, 0x0F24 };
static const u16 Ch13EphraimMapChanges_change_2[] = { 0x0080 };
static const u16 Ch13EphraimMapChanges_change_3[] = { 0x0080 };
static const u16 Ch13EphraimMapChanges_change_4[] = { 0x0028, 0x0010, 0x002C };
static const struct MapChange Ch13EphraimMapChanges[] = {
    { 0, 3, 16, 3, 3, Ch13EphraimMapChanges_change_0 },
    { 1, 16, 11, 3, 3, Ch13EphraimMapChanges_change_1 },
    { 2, 4, 18, 1, 1, Ch13EphraimMapChanges_change_2 },
    { 3, 17, 13, 1, 1, Ch13EphraimMapChanges_change_3 },
    { 4, 10, 17, 1, 3, Ch13EphraimMapChanges_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 Ch14EphraimMapChanges_change_0[] = { 0x0680, 0x0684, 0x0684, 0x0680, 0x0684, 0x0684 };
static const u16 Ch14EphraimMapChanges_change_1[] = { 0x0980, 0x080C, 0x0890, 0x0984, 0x0A94, 0x080C, 0x0984, 0x088C, 0x088C };
static const u16 Ch14EphraimMapChanges_change_2[] = { 0x0904, 0x088C, 0x088C, 0x0980, 0x080C, 0x080C, 0x0984, 0x0888, 0x0810 };
static const u16 Ch14EphraimMapChanges_change_3[] = { 0x0680, 0x0684, 0x0684, 0x0680, 0x0684, 0x0684 };
static const u16 Ch14EphraimMapChanges_change_4[] = { 0x0004 };
static const u16 Ch14EphraimMapChanges_change_5[] = { 0x0004 };
static const u16 Ch14EphraimMapChanges_change_6[] = { 0x0004 };
static const u16 Ch14EphraimMapChanges_change_7[] = { 0x0004 };
static const u16 Ch14EphraimMapChanges_change_8[] = { 0x0004 };
static const struct MapChange Ch14EphraimMapChanges[] = {
    { 0, 13, 7, 3, 2, Ch14EphraimMapChanges_change_0 },
    { 1, 6, 12, 3, 3, Ch14EphraimMapChanges_change_1 },
    { 2, 20, 12, 3, 3, Ch14EphraimMapChanges_change_2 },
    { 3, 13, 20, 3, 2, Ch14EphraimMapChanges_change_3 },
    { 4, 13, 18, 1, 1, Ch14EphraimMapChanges_change_4 },
    { 5, 15, 18, 1, 1, Ch14EphraimMapChanges_change_5 },
    { 6, 3, 1, 1, 1, Ch14EphraimMapChanges_change_6 },
    { 7, 27, 1, 1, 1, Ch14EphraimMapChanges_change_7 },
    { 8, 14, 18, 1, 1, Ch14EphraimMapChanges_change_8 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges1[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 UnusedMapChanges2_change_0[] = { 0x0740, 0x0C40, 0x0000, 0x0C44 };
static const u16 UnusedMapChanges2_change_1[] = { 0x08A4, 0x0C40, 0x07B0, 0x0000, 0x0C44, 0x0000 };
static const u16 UnusedMapChanges2_change_2[] = { 0x0004 };
static const u16 UnusedMapChanges2_change_3[] = { 0x0004 };
static const u16 UnusedMapChanges2_change_4[] = { 0x0004 };
static const struct MapChange UnusedMapChanges2[] = {
    { 0, 3, 3, 2, 2, UnusedMapChanges2_change_0 },
    { 1, 2, 10, 3, 2, UnusedMapChanges2_change_1 },
    { 2, 3, 12, 1, 1, UnusedMapChanges2_change_2 },
    { 3, 20, 2, 1, 1, UnusedMapChanges2_change_3 },
    { 4, 20, 4, 1, 1, UnusedMapChanges2_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 UnusedMapChanges3_change_0[] = { 0x001C, 0x009C, 0x002C };
static const u16 UnusedMapChanges3_change_1[] = { 0x0110, 0x0094, 0x0114 };
static const struct MapChange UnusedMapChanges3[] = {
    { 0, 4, 14, 1, 3, UnusedMapChanges3_change_0 },
    { 1, 15, 13, 3, 1, UnusedMapChanges3_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges4[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 UnusedMapChanges5_change_0[] = { 0x0004 };
static const u16 UnusedMapChanges5_change_1[] = { 0x0004 };
static const u16 UnusedMapChanges5_change_2[] = { 0x0B40, 0x0B44 };
static const u16 UnusedMapChanges5_change_3[] = { 0x0004 };
static const u16 UnusedMapChanges5_change_4[] = { 0x0004 };
static const struct MapChange UnusedMapChanges5[] = {
    { 0, 2, 12, 1, 1, UnusedMapChanges5_change_0 },
    { 1, 4, 12, 1, 1, UnusedMapChanges5_change_1 },
    { 2, 3, 15, 1, 2, UnusedMapChanges5_change_2 },
    { 3, 27, 12, 1, 1, UnusedMapChanges5_change_3 },
    { 4, 27, 10, 1, 1, UnusedMapChanges5_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges6[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges7[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges8[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange TowerOfValni1MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange TowerOfValni2MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 TowerOfValni3MapChanges_change_0[] = { 0x0110 };
static const struct MapChange TowerOfValni3MapChanges[] = {
    { 0, 10, 3, 1, 1, TowerOfValni3MapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange TowerOfValni4MapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 TowerOfValni5MapChanges_change_0[] = { 0x0110 };
static const u16 TowerOfValni5MapChanges_change_1[] = { 0x0110 };
static const struct MapChange TowerOfValni5MapChanges[] = {
    { 0, 6, 9, 1, 1, TowerOfValni5MapChanges_change_0 },
    { 1, 14, 14, 1, 1, TowerOfValni5MapChanges_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 TowerOfValni6MapChanges_change_0[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_1[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_2[] = { 0x0110 };
static const u16 TowerOfValni6MapChanges_change_3[] = { 0x0110 };
static const u16 TowerOfValni6MapChanges_change_4[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_5[] = { 0x08C8, 0x001C, 0x06C8, 0x08C4, 0x001C, 0x08C0, 0x0000, 0x0014, 0x0000 };
static const u16 TowerOfValni6MapChanges_change_6[] = { 0x08C8, 0x001C, 0x06C8, 0x08C4, 0x001C, 0x08C0, 0x0000, 0x0014, 0x0000 };
static const u16 TowerOfValni6MapChanges_change_7[] = { 0x08C8, 0x0000, 0x08C4, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_8[] = { 0x08C8, 0x001C, 0x08C4, 0x001C, 0x0000, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_9[] = { 0x08C8, 0x001C, 0x08C4, 0x001C, 0x0000, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_10[] = { 0x0110 };
static const u16 TowerOfValni6MapChanges_change_11[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_12[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_13[] = { 0x08D4, 0x0000, 0x08CC, 0x0000, 0x0018, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_14[] = { 0x06C8, 0x06CC, 0x08C0, 0x0844, 0x0018, 0x0018 };
static const u16 TowerOfValni6MapChanges_change_15[] = { 0x08C8, 0x001C, 0x08C4, 0x001C, 0x0000, 0x0014 };
static const u16 TowerOfValni6MapChanges_change_16[] = { 0x0110 };
static const struct MapChange TowerOfValni6MapChanges[] = {
    { 0, 5, 3, 2, 3, TowerOfValni6MapChanges_change_0 },
    { 1, 8, 0, 2, 3, TowerOfValni6MapChanges_change_1 },
    { 2, 10, 1, 1, 1, TowerOfValni6MapChanges_change_2 },
    { 3, 12, 1, 1, 1, TowerOfValni6MapChanges_change_3 },
    { 4, 4, 8, 2, 3, TowerOfValni6MapChanges_change_4 },
    { 5, 9, 6, 3, 3, TowerOfValni6MapChanges_change_5 },
    { 6, 14, 6, 3, 3, TowerOfValni6MapChanges_change_6 },
    { 7, 7, 11, 2, 3, TowerOfValni6MapChanges_change_7 },
    { 8, 13, 9, 2, 3, TowerOfValni6MapChanges_change_8 },
    { 9, 17, 9, 2, 3, TowerOfValni6MapChanges_change_9 },
    { 10, 2, 18, 1, 1, TowerOfValni6MapChanges_change_10 },
    { 11, 4, 16, 2, 3, TowerOfValni6MapChanges_change_11 },
    { 12, 7, 16, 2, 3, TowerOfValni6MapChanges_change_12 },
    { 13, 10, 16, 2, 3, TowerOfValni6MapChanges_change_13 },
    { 14, 16, 16, 2, 3, TowerOfValni6MapChanges_change_14 },
    { 15, 18, 16, 2, 3, TowerOfValni6MapChanges_change_15 },
    { 16, 19, 1, 1, 1, TowerOfValni6MapChanges_change_16 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 TowerOfValni7MapChanges_change_0[] = { 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094 };
static const u16 TowerOfValni7MapChanges_change_1[] = { 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094 };
static const u16 TowerOfValni7MapChanges_change_2[] = { 0x0094, 0x0094, 0x0094, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094, 0x0000, 0x0094 };
static const u16 TowerOfValni7MapChanges_change_3[] = { 0x0094, 0x0094, 0x0094, 0x0094 };
static const u16 TowerOfValni7MapChanges_change_4[] = { 0x0094, 0x0094, 0x0094, 0x0094, 0x0094, 0x0094 };
static const struct MapChange TowerOfValni7MapChanges[] = {
    { 0, 9, 13, 1, 7, TowerOfValni7MapChanges_change_0 },
    { 1, 17, 12, 1, 8, TowerOfValni7MapChanges_change_1 },
    { 2, 22, 4, 2, 11, TowerOfValni7MapChanges_change_2 },
    { 3, 12, 2, 1, 4, TowerOfValni7MapChanges_change_3 },
    { 4, 4, 2, 3, 2, TowerOfValni7MapChanges_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 TowerOfValni8MapChanges_change_0[] = { 0x0110 };
static const struct MapChange TowerOfValni8MapChanges[] = {
    { 0, 11, 8, 1, 1, TowerOfValni8MapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges9[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange UnusedMapChanges10[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins1MapChanges_change_0[] = { 0x0DD0, 0x0000 };
static const struct MapChange LagdouRuins1MapChanges[] = {
    { 0, 4, 3, 2, 1, LagdouRuins1MapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins2MapChanges_change_0[] = { 0x0D18, 0x0000, 0x0654, 0x0000, 0x0E3C, 0x0FBC };
static const struct MapChange LagdouRuins2MapChanges[] = {
    { 0, 9, 13, 2, 3, LagdouRuins2MapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins3MapChanges_change_0[] = { 0x0004 };
static const u16 LagdouRuins3MapChanges_change_1[] = { 0x0D18, 0x0000, 0x0E3C, 0x0FB8 };
static const u16 LagdouRuins3MapChanges_change_2[] = { 0x0EB8 };
static const u16 LagdouRuins3MapChanges_change_3[] = { 0x0EB8, 0x0FBC };
static const u16 LagdouRuins3MapChanges_change_4[] = { 0x0C18, 0x0C18, 0x0C18, 0x0000, 0x0E3C, 0x0E3C };
static const u16 LagdouRuins3MapChanges_change_5[] = { 0x0D18, 0x0000, 0x0E3C, 0x0FB8 };
static const u16 LagdouRuins3MapChanges_change_6[] = { 0x0004 };
static const u16 LagdouRuins3MapChanges_change_7[] = { 0x0EB8 };
static const u16 LagdouRuins3MapChanges_change_8[] = { 0x0EB8, 0x0FBC };
static const u16 LagdouRuins3MapChanges_change_9[] = { 0x0EB8, 0x0FBC };
static const u16 LagdouRuins3MapChanges_change_10[] = { 0x0EBC };
static const u16 LagdouRuins3MapChanges_change_11[] = { 0x0004 };
static const u16 LagdouRuins3MapChanges_change_12[] = { 0x0D18, 0x0EB8, 0x0E3C, 0x0FB8 };
static const struct MapChange LagdouRuins3MapChanges[] = {
    { 0, 1, 2, 1, 1, LagdouRuins3MapChanges_change_0 },
    { 1, 3, 1, 2, 2, LagdouRuins3MapChanges_change_1 },
    { 2, 1, 7, 1, 1, LagdouRuins3MapChanges_change_2 },
    { 3, 8, 6, 2, 1, LagdouRuins3MapChanges_change_3 },
    { 4, 14, 0, 3, 2, LagdouRuins3MapChanges_change_4 },
    { 5, 15, 3, 2, 2, LagdouRuins3MapChanges_change_5 },
    { 6, 17, 3, 1, 1, LagdouRuins3MapChanges_change_6 },
    { 7, 17, 8, 1, 1, LagdouRuins3MapChanges_change_7 },
    { 8, 8, 10, 1, 2, LagdouRuins3MapChanges_change_8 },
    { 9, 1, 15, 1, 2, LagdouRuins3MapChanges_change_9 },
    { 10, 1, 22, 1, 1, LagdouRuins3MapChanges_change_10 },
    { 11, 15, 15, 1, 1, LagdouRuins3MapChanges_change_11 },
    { 12, 17, 13, 2, 2, LagdouRuins3MapChanges_change_12 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins4MapChanges_change_0[] = { 0x0D18, 0x0000, 0x0650, 0x0000, 0x0E3C, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_1[] = { 0x0DAC, 0x0EBC, 0x0C20, 0x05D4, 0x0EBC, 0x0D98, 0x0000, 0x0FBC, 0x0000 };
static const u16 LagdouRuins4MapChanges_change_2[] = { 0x0004 };
static const u16 LagdouRuins4MapChanges_change_3[] = { 0x0004 };
static const u16 LagdouRuins4MapChanges_change_4[] = { 0x0C24, 0x0EBC, 0x05D4, 0x0EBC, 0x0000, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_5[] = { 0x0C24, 0x0EBC, 0x0C90, 0x05D4, 0x0EBC, 0x0000, 0x0000, 0x0FBC, 0x0000 };
static const u16 LagdouRuins4MapChanges_change_6[] = { 0x0C94, 0x0EB8, 0x0000, 0x0EB8, 0x0000, 0x0EB8 };
static const u16 LagdouRuins4MapChanges_change_7[] = { 0x0C24, 0x0EBC, 0x05D4, 0x0EBC, 0x0000, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_8[] = { 0x0C18, 0x0C18, 0x0D9C, 0x0D9C, 0x0E3C, 0x0E3C };
static const u16 LagdouRuins4MapChanges_change_9[] = { 0x0D18, 0x0000, 0x0654, 0x0000, 0x0E3C, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_10[] = { 0x0D18, 0x0000, 0x0654, 0x0000, 0x0E3C, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_11[] = { 0x0D18, 0x0000, 0x0654, 0x0000, 0x0E3C, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_12[] = { 0x0C24, 0x0EBC, 0x0C90, 0x05D4, 0x0EBC, 0x0000, 0x0000, 0x0FBC, 0x0000 };
static const u16 LagdouRuins4MapChanges_change_13[] = { 0x0EB8, 0x0D18, 0x0EBC, 0x0654, 0x0EC4, 0x0000 };
static const u16 LagdouRuins4MapChanges_change_14[] = { 0x0DAC, 0x0EBC, 0x0C90, 0x05D4, 0x0EBC, 0x0000, 0x0000, 0x0FBC, 0x0000 };
static const u16 LagdouRuins4MapChanges_change_15[] = { 0x0C24, 0x0EBC, 0x05D4, 0x0EBC, 0x0000, 0x0FBC };
static const u16 LagdouRuins4MapChanges_change_16[] = { 0x0C94, 0x0EBC, 0x0000, 0x0EBC, 0x0000, 0x0EB8 };
static const u16 LagdouRuins4MapChanges_change_17[] = { 0x0C24, 0x0EBC, 0x05D4, 0x0EBC, 0x0000, 0x0FBC };
static const struct MapChange LagdouRuins4MapChanges[] = {
    { 0, 4, 3, 2, 3, LagdouRuins4MapChanges_change_0 },
    { 1, 12, 2, 3, 3, LagdouRuins4MapChanges_change_1 },
    { 2, 18, 2, 1, 1, LagdouRuins4MapChanges_change_2 },
    { 3, 1, 26, 1, 1, LagdouRuins4MapChanges_change_3 },
    { 4, 1, 9, 2, 3, LagdouRuins4MapChanges_change_4 },
    { 5, 7, 9, 3, 3, LagdouRuins4MapChanges_change_5 },
    { 6, 12, 9, 2, 3, LagdouRuins4MapChanges_change_6 },
    { 7, 1, 13, 2, 3, LagdouRuins4MapChanges_change_7 },
    { 8, 4, 9, 2, 3, LagdouRuins4MapChanges_change_8 },
    { 9, 6, 13, 2, 3, LagdouRuins4MapChanges_change_9 },
    { 10, 11, 13, 2, 3, LagdouRuins4MapChanges_change_10 },
    { 11, 4, 17, 2, 3, LagdouRuins4MapChanges_change_11 },
    { 12, 7, 16, 3, 3, LagdouRuins4MapChanges_change_12 },
    { 13, 14, 16, 2, 3, LagdouRuins4MapChanges_change_13 },
    { 14, 16, 15, 3, 3, LagdouRuins4MapChanges_change_14 },
    { 15, 6, 20, 2, 3, LagdouRuins4MapChanges_change_15 },
    { 16, 11, 20, 2, 3, LagdouRuins4MapChanges_change_16 },
    { 17, 9, 24, 2, 3, LagdouRuins4MapChanges_change_17 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins5MapChanges_change_0[] = { 0x0004 };
static const u16 LagdouRuins5MapChanges_change_1[] = { 0x0004 };
static const u16 LagdouRuins5MapChanges_change_2[] = { 0x0004 };
static const u16 LagdouRuins5MapChanges_change_3[] = { 0x0E14, 0x0EBC, 0x0000, 0x0EBC, 0x0000, 0x0EB8 };
static const u16 LagdouRuins5MapChanges_change_4[] = { 0x0EB8, 0x0D18, 0x0EB8, 0x0654, 0x0FBC, 0x0000 };
static const struct MapChange LagdouRuins5MapChanges[] = {
    { 0, 4, 4, 1, 1, LagdouRuins5MapChanges_change_0 },
    { 1, 13, 10, 1, 1, LagdouRuins5MapChanges_change_1 },
    { 2, 17, 21, 1, 1, LagdouRuins5MapChanges_change_2 },
    { 3, 0, 6, 2, 3, LagdouRuins5MapChanges_change_3 },
    { 4, 8, 5, 2, 3, LagdouRuins5MapChanges_change_4 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins6MapChanges_change_0[] = { 0x0D18, 0x0000, 0x0E3C, 0x0FBC };
static const u16 LagdouRuins6MapChanges_change_1[] = { 0x0EBC, 0x0FBC };
static const u16 LagdouRuins6MapChanges_change_2[] = { 0x0EBC };
static const struct MapChange LagdouRuins6MapChanges[] = {
    { 0, 7, 1, 2, 2, LagdouRuins6MapChanges_change_0 },
    { 1, 17, 4, 1, 2, LagdouRuins6MapChanges_change_1 },
    { 2, 16, 7, 1, 1, LagdouRuins6MapChanges_change_2 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins7MapChanges_change_0[] = { 0x0004 };
static const u16 LagdouRuins7MapChanges_change_1[] = { 0x0C18, 0x0C18, 0x0E3C, 0x0E3C };
static const u16 LagdouRuins7MapChanges_change_2[] = { 0x0C94, 0x0EBC, 0x0C90, 0x0000, 0x0EBC, 0x0000 };
static const struct MapChange LagdouRuins7MapChanges[] = {
    { 0, 5, 11, 1, 1, LagdouRuins7MapChanges_change_0 },
    { 1, 14, 17, 2, 2, LagdouRuins7MapChanges_change_1 },
    { 2, 16, 4, 3, 2, LagdouRuins7MapChanges_change_2 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins8MapChanges_change_0[] = { 0x06CC, 0x025C, 0x06CC, 0x02DC, 0x06CC, 0x02DC };
static const u16 LagdouRuins8MapChanges_change_1[] = { 0x06CC, 0x06CC, 0x0358, 0x06CC, 0x06CC, 0x02DC };
static const u16 LagdouRuins8MapChanges_change_2[] = { 0x06CC, 0x06CC, 0x06CC, 0x06CC, 0x06CC, 0x06CC, 0x02DC, 0x02D8, 0x02D8, 0x06CC, 0x06CC, 0x0358, 0x02D8, 0x0000 };
static const u16 LagdouRuins8MapChanges_change_3[] = { 0x06CC, 0x0358 };
static const u16 LagdouRuins8MapChanges_change_4[] = { 0x06CC, 0x06CC, 0x0358, 0x06CC, 0x06CC, 0x02DC, 0x06CC, 0x06CC, 0x02DC, 0x06CC, 0x06CC, 0x02DC };
static const u16 LagdouRuins8MapChanges_change_5[] = { 0x06CC, 0x06CC, 0x02DC, 0x06CC, 0x06CC, 0x02DC };
static const u16 LagdouRuins8MapChanges_change_6[] = { 0x06CC, 0x06CC, 0x0000 };
static const u16 LagdouRuins8MapChanges_change_7[] = { 0x06CC, 0x06CC, 0x06CC, 0x0358, 0x02D8, 0x02D8 };
static const u16 LagdouRuins8MapChanges_change_8[] = { 0x06CC, 0x06CC };
static const u16 LagdouRuins8MapChanges_change_9[] = { 0x0000, 0x0000, 0x0000, 0x0000, 0x06CC, 0x06CC, 0x06CC, 0x06CC, 0x06CC, 0x06CC };
static const u16 LagdouRuins8MapChanges_change_10[] = { 0x06CC, 0x06CC, 0x0000 };
static const u16 LagdouRuins8MapChanges_change_11[] = { 0x06CC, 0x0000, 0x06CC, 0x02DC };
static const u16 LagdouRuins8MapChanges_change_12[] = { 0x0004 };
static const u16 LagdouRuins8MapChanges_change_13[] = { 0x0DB0, 0x0D28 };
static const struct MapChange LagdouRuins8MapChanges[] = {
    { 0, 0, 15, 2, 3, LagdouRuins8MapChanges_change_0 },
    { 1, 0, 10, 3, 2, LagdouRuins8MapChanges_change_1 },
    { 2, 0, 3, 7, 2, LagdouRuins8MapChanges_change_2 },
    { 3, 5, 19, 1, 2, LagdouRuins8MapChanges_change_3 },
    { 4, 9, 15, 3, 4, LagdouRuins8MapChanges_change_4 },
    { 5, 9, 9, 3, 2, LagdouRuins8MapChanges_change_5 },
    { 6, 9, 6, 3, 1, LagdouRuins8MapChanges_change_6 },
    { 7, 12, 11, 3, 2, LagdouRuins8MapChanges_change_7 },
    { 8, 11, 20, 2, 1, LagdouRuins8MapChanges_change_8 },
    { 9, 15, 13, 5, 2, LagdouRuins8MapChanges_change_9 },
    { 10, 16, 7, 3, 1, LagdouRuins8MapChanges_change_10 },
    { 11, 4, 16, 2, 2, LagdouRuins8MapChanges_change_11 },
    { 12, 4, 12, 1, 1, LagdouRuins8MapChanges_change_12 },
    { 13, 16, 5, 2, 1, LagdouRuins8MapChanges_change_13 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins9MapChanges_change_0[] = { 0x0734, 0x0B70, 0x0730 };
static const u16 LagdouRuins9MapChanges_change_1[] = { 0x0734, 0x0B70, 0x0730 };
static const struct MapChange LagdouRuins9MapChanges[] = {
    { 0, 1, 5, 3, 1, LagdouRuins9MapChanges_change_0 },
    { 1, 15, 11, 3, 1, LagdouRuins9MapChanges_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 LagdouRuins10MapChanges_change_0[] = { 0x0004 };
static const struct MapChange LagdouRuins10MapChanges[] = {
    { 0, 9, 2, 1, 1, LagdouRuins10MapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange LordsSplitMapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const struct MapChange MelkaenCoastMapChanges[] = {
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 UnusedMapChanges11_change_0[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_1[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_2[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_3[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_4[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_5[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_6[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_7[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_8[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_9[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_10[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_11[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_12[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_13[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_14[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_15[] = { 0x0100 };
static const u16 UnusedMapChanges11_change_16[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_17[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_18[] = { 0x0810 };
static const u16 UnusedMapChanges11_change_19[] = { 0x0810 };
static const struct MapChange UnusedMapChanges11[] = {
    { 0, 14, 10, 1, 1, UnusedMapChanges11_change_0 },
    { 1, 13, 10, 1, 1, UnusedMapChanges11_change_1 },
    { 2, 12, 10, 1, 1, UnusedMapChanges11_change_2 },
    { 3, 11, 10, 1, 1, UnusedMapChanges11_change_3 },
    { 4, 14, 11, 1, 1, UnusedMapChanges11_change_4 },
    { 5, 13, 11, 1, 1, UnusedMapChanges11_change_5 },
    { 6, 12, 11, 1, 1, UnusedMapChanges11_change_6 },
    { 7, 11, 11, 1, 1, UnusedMapChanges11_change_7 },
    { 8, 14, 12, 1, 1, UnusedMapChanges11_change_8 },
    { 9, 13, 12, 1, 1, UnusedMapChanges11_change_9 },
    { 10, 12, 12, 1, 1, UnusedMapChanges11_change_10 },
    { 11, 11, 12, 1, 1, UnusedMapChanges11_change_11 },
    { 12, 14, 13, 1, 1, UnusedMapChanges11_change_12 },
    { 13, 13, 13, 1, 1, UnusedMapChanges11_change_13 },
    { 14, 12, 13, 1, 1, UnusedMapChanges11_change_14 },
    { 15, 11, 13, 1, 1, UnusedMapChanges11_change_15 },
    { 16, 14, 14, 1, 1, UnusedMapChanges11_change_16 },
    { 17, 13, 14, 1, 1, UnusedMapChanges11_change_17 },
    { 18, 12, 14, 1, 1, UnusedMapChanges11_change_18 },
    { 19, 11, 14, 1, 1, UnusedMapChanges11_change_19 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 RenaisThroneMapChanges_change_0[] = { 0x0C40, 0x0C44 };
static const struct MapChange RenaisThroneMapChanges[] = {
    { 0, 7, 7, 2, 1, RenaisThroneMapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 GradoPrisonMapChanges_change_0[] = { 0x0780, 0x0788, 0x0780, 0x0788 };
static const struct MapChange GradoPrisonMapChanges[] = {
    { 0, 18, 6, 2, 2, GradoPrisonMapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 GradoShrineMapChangesPast_change_0[] = { 0x0DE8, 0x0E68 };
static const u16 GradoShrineMapChangesPast_change_1[] = { 0x0DE4, 0x0E64 };
static const struct MapChange GradoShrineMapChangesPast[] = {
    { 0, 5, 2, 1, 2, GradoShrineMapChangesPast_change_0 },
    { 1, 9, 2, 1, 2, GradoShrineMapChangesPast_change_1 },
    { -1, 0, 0, 0, 0, NULL },
};

static const u16 RenaisShrineMapChanges_change_0[] = { 0x0B40, 0x0B44, 0x0B44 };
static const struct MapChange RenaisShrineMapChanges[] = {
    { 0, 6, 7, 3, 1, RenaisShrineMapChanges_change_0 },
    { -1, 0, 0, 0, 0, NULL },
};

