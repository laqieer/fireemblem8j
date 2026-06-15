#include "global.h"

// Region-different from US: JP handles its variable-width text encoding
// (a 0x04 lead byte advances 1, every other glyph advances 2) where US str++.
char *GetStringLineEnd(char *str)
{
    u8 c;
    while ((c = *str) > 1) {
        if (c == 4)
            str += 1;
        else
            str += 2;
    }
    return str;
}
