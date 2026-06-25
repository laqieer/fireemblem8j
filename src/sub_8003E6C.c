#include "global.h"

// JP-only EWRAM linked-list accessor. key[0]=match byte, key[1]=table index.
// Walks the hash-bucket list; if a node's match byte equals key[0], stores the
// node's value byte into *out. Returns key advanced past the 2-byte key.
u8 *sub_8003E6C(u8 *key, int *out)
{
    u32 base = *(u32 *)0x02028E70;
    u8 match = *key++;
    int idx = *key++;
    u8 **node;

    node = *(u8 ***)((*(u32 *)(base + 4)) + idx * 4 - 0x100);

    while (node != 0)
    {
        if (((u8 *)node)[4] == match)
        {
            *out = ((u8 *)node)[5];
            break;
        }
        node = *(u8 ***)node;
    }

    return key;
}
