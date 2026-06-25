#include "global.h"
#include "functions.h"
#include "variables.h"

struct DivinationData
{
    /* 00 */ int chapter;
    /* 04 */ int unk04;
    /* 08 */ int unk08;
    /* 0C */ int unk0C;
};

extern const struct DivinationData gDivinationDataTable[];

int sub_80A40A0(int chapter, int kind)
{
    const struct DivinationData * it = gDivinationDataTable;

    while (it->chapter != 0)
    {
        if (chapter == it->chapter)
        {
            if (kind > 3)
                return it->unk04;

            if (kind > 1)
                return it->unk08;

            return it->unk0C;
        }

        it++;
    }

    return 0;
}

int sub_80A40D4(int index)
{
    if (index % 3 == 0)
        return gDivinationDataTable[index / 3].unk04;

    if (index % 3 == 1)
        return gDivinationDataTable[index / 3].unk08;

    return gDivinationDataTable[index / 3].unk0C;
}

int sub_80A412C(int index)
{
    return gDivinationDataTable[index / 3].chapter;
}
