#include "global.h"
#include "chapterdata.h"
#include "sysutil.h"

struct DigitGlyphs
{
    u32 glyph[10];
};

extern const struct DigitGlyphs gUnknown_081F5840;

char *sub_80B3564(int chIndex, char *dst, s8 flag)
{
    struct DigitGlyphs digits;
    int n;
    char buf[0x20];

    digits = gUnknown_081F5840;

    n = GetROMChapterStruct(chIndex)->prepScreenNumber >> 1;

    if ((unsigned)(chIndex - 0x24) <= 0x13)
        return dst;

    if ((unsigned)chIndex > 0x23)
        goto _default;

    switch (chIndex)
    {
    case 0:
        dst = AppendString(GetStringFromIndexInBuffer(0xE3, buf), dst);
        dst = AppendString(GetStringFromIndexInBuffer(0xE7, buf), dst);
        return dst;

    case 21:
    case 22:
    case 34:
    case 35:
        dst = AppendString(GetStringFromIndexInBuffer(0xE2, buf), dst);
        dst = AppendString(GetStringFromIndexInBuffer(0xE7, buf), dst);
        return dst;

    default:
    _default:
        if (flag != 0)
            dst = AppendString(GetStringFromIndexInBuffer(0xDF, buf), dst);

        if (n > 9)
            dst = AppendString(GetStringFromIndexInBuffer(digits.glyph[n / 10], buf), dst);

        dst = AppendString(GetStringFromIndexInBuffer(digits.glyph[n % 10], buf), dst);
        dst = AppendString(GetStringFromIndexInBuffer(0xE0, buf), dst);

        if (GetROMChapterStruct(chIndex)->prepScreenNumber & 1)
            dst = AppendString(GetStringFromIndexInBuffer(0xE1, buf), dst);

        dst = AppendString(GetStringFromIndexInBuffer(0xE7, buf), dst);
        return dst;
    }
}
