#include "global.h"
#include "fontgrp.h"

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};

extern struct SpecialCharSt sSpecialCharStList[64];
int AddSpecialChar(struct SpecialCharSt *st, int color, int id);

int GetSpecialCharChr(int color, int id)
{
    struct SpecialCharSt *it = sSpecialCharStList;

    while (1) {
        if (it->color < 0)
            return AddSpecialChar(it, color, id);

        if (it->color == color && it->id == id)
            return it->chr_position;

        it++;
    }
}
