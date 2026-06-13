#include "global.h"
#include "bmmap.h"

extern u8** sInitializingMap;

void BmMapInit(void* buffer, u8*** outHandle, int x, int y) {
    int i;
    u8* itBuffer;

    sInitializingMap = buffer;

    x  += 2;
    y += 4;

    itBuffer = buffer + y * sizeof(u8*);

    for (i = 0; i < y; ++i) {
        sInitializingMap[i] = itBuffer;
        itBuffer += x;
    }

    *outHandle = sInitializingMap + 2;
}
