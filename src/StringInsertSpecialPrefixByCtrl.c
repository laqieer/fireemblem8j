#include "global.h"
#include "proc.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmlib.h"
#include "bmmind.h"
#include "scene.h"

struct JpMsgBuffer
{
    u8 buffer1[0x400];
    u8 buffer2[0x400];
    u8 buffer3[0x400];
    u8 buffer4[0x100];
    u8 buffer5[0x100];
};

extern struct JpMsgBuffer sMsgString;

//! FE8U = 0x0800A004
char * StringInsertSpecialPrefixByCtrl(void)
{
    u8 * r5 = sMsgString.buffer2;
    u8 * dst = sMsgString.buffer3;

    CopyString(r5, sMsgString.buffer1);
    while (*r5 != 0)
    {
        if (*r5 < '\x20')
            *dst++ = *r5++;
        else if (*r5 != '\x80') /* Normal string (2-byte Shift-JIS) */
        {
            *dst++ = *r5++;
            *dst++ = *r5++;
        }
        else
        {
            int r1;

            r5++;
            switch (*r5)
            {
            case '\x12':    /* wh:1280 */
                r1 = 0;
                break;
            case '\x13':    /* wh:1380 */
                r1 = 1;
                break;
            case '\x14':    /* wh:1480 */
                r1 = 2;
                break;
            case '\x15':    /* wh:1580 */
                r1 = 3;
                break;
            case '\x20':    /* [Tact]: "\x20\x80" */
                CopyString(dst, GetTacticianName());
                goto label;
            case '\x22':    /* [Item]: "\x22\x80" */
                CopyString(dst, GetItemName(gActionData.item));
                goto label;
            default:
                *dst++ = 0x80;
                *dst++ = *r5++;
                continue;
            }
            CopyString(dst, GetStringFromIndex(GetCharacterData(gPlaySt.unk1C[r1])->nameTextId));
        label:
            while (*dst != 0)
                dst++;
            r5++;
        }
    }
    *dst = 0;
    return sMsgString.buffer3;
}
