#include "global.h"
#include "constants/characters.h"

enum
{
    DEFEAT_DIED = 0,
};

struct EndingDefeatEnt
{
    /* 00 */ u8 pid;
    /* 01 */ u8 defeatType;
    /* 02 */ STRUCT_PAD(0x02, 0x04);
};

extern struct EndingDefeatEnt gCharacterEndingDefeatLut[];

int GetPidDefeatType(int pid)
{
    struct EndingDefeatEnt * ent;

    for (ent = gCharacterEndingDefeatLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
        {
            return ent->defeatType;
        }
    }

    return DEFEAT_DIED;
}
