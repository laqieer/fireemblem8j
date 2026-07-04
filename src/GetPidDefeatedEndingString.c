#include "global.h"

struct UnitUsageStats
{
    /* 00 */ u8 _pad00[5];
    /* 05 */ u8 unk5;
    /* 06 */ u8 _pad06[0xe - 6];
    /* 0E */ u8 unkE;
};

struct ROMChapterData
{
    /* 00 */ u8 _pad00[0x70];
    /* 70 */ u16 unk70;
};

#define gpDefeatedEndingLocString (*(char **)0x08AC059C)

extern int GetPidDefeatType(int pid);
extern void CheckPermanentFlag(int flag);
extern struct UnitUsageStats *sub_80A9740(int idx);
extern int sub_80C086C(int a);
extern char *sub_80B3564(int a, char *str, int c);
extern const struct ROMChapterData *GetROMChapterStruct(unsigned chIndex);
extern char * GetStringFromIndex(int msgid);
extern char *sub_80B3538(int a, char *str);
extern char *AppendCharacter(int character, char *str);

/* The callees below are still undecompiled in the JP tree and are not global
 * linker symbols; bind them to their JP ROM addresses exactly as the original
 * asm/sub_80BB240.s did via .set (CheckPermanentFlag and GetStringFromIndex already
 * resolve as baseline globals at the same addresses, so they are omitted). */
asm(".set GetPidDefeatType, 0x080BB21C + 1");
asm(".set sub_80A9740, 0x080A9740 + 1");
asm(".set sub_80C086C, 0x080C086C + 1");
asm(".set sub_80B3564, 0x080B3564 + 1");
asm(".set GetROMChapterStruct, 0x08034520 + 1");
asm(".set sub_80B3538, 0x080B3538 + 1");
asm(".set AppendCharacter, 0x080B3558 + 1");

char *GetPidDefeatedEndingString(int pid)
{
    struct UnitUsageStats *bwl;
    register char *str asm("r4");
    register int chId asm("r5");
    register int pidCopy asm("r6");
    register int type;
    int msg;
    register int tmp asm("r1");

    pidCopy = pid;
    str = gpDefeatedEndingLocString;

    type = GetPidDefeatType(pidCopy);

    if (type == 4)
    {
        CheckPermanentFlag(0x7d);
        pidCopy = 0x100;
    }

    bwl = sub_80A9740((u8)pidCopy);
    tmp = bwl->unk5;
    chId = ((u32)tmp << 0x1a) >> 0x1a;
    *str = 0;

    if (bwl->unkE >> 7)
    {
        msg = sub_80C086C(chId);
    }
    else
    {
        str = sub_80B3564(chId, str, 1);
        msg = (int)GetStringFromIndex(GetROMChapterStruct(chId)->unk70);
    }

    str = sub_80B3538(msg, str);
    str = AppendCharacter(1, str);

    switch (type)
    {
        case 0:
            msg = (int)GetStringFromIndex(0x749);
            str = sub_80B3538(msg, str);
            break;
        case 1:
            msg = (int)GetStringFromIndex(0x74a);
            str = sub_80B3538(msg, str);
            break;
        case 2:
            msg = (int)GetStringFromIndex(0x74b);
            str = sub_80B3538(msg, str);
            break;
        case 3:
            msg = (int)GetStringFromIndex(0x749);
            str = sub_80B3538(msg, str);
            break;
        case 4:
        {
            register int tmp2 asm("r0");

            tmp2 = 0x100;
            asm volatile("" : "=r"(tmp2) : "0"(tmp2));
            msg = (int)GetStringFromIndex(0x7b1);
            str = sub_80B3538(msg, str);
            break;
        }
        case 5:
            return (char *)0;
    }

    return gpDefeatedEndingLocString;
}
