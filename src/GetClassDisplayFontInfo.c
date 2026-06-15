#include "global.h"
#include "classdisplayfont.h"

extern struct ClassDisplayFont gClassDisplayFontData[];

struct ClassDisplayFont * GetClassDisplayFontInfo(char chr) {

    if ((u8)(chr - 0x61) < 0x1A) {
        return &gClassDisplayFontData[chr-0x47];
    }

    if ((u8)(chr - 0x41) < 0x1A) {
        return &gClassDisplayFontData[chr-0x41];
    }

    return NULL;
}
