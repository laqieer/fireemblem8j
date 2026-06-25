#include "global.h"

// JP-only worldmap/list paging-setup leaf @ 0x080A6A30
extern int gUnk_02014EEC;
extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern int gUnk_02014EF8;

void sub_80A6A30(int perPage, int x)
{
    int* pPages;
    int pages;

    gUnk_02014EEC = perPage;
    gUnk_02014EF0 = (1 << perPage) - 1;

    pPages = &gUnk_02014EF4;
    pages = 30 / perPage;
    *pPages = pages;
    if (30 % perPage > 0)
        *pPages = pages + 1;

    gUnk_02014EF8 = x;
}
