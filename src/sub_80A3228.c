#include "global.h"

// JP-only region-different leaf (bmsave-lib neighbourhood, JP 0x080A3228).
// Reads gPlaySt's 0x2B byte (low bit, discarded) then stores 0x7B7 - field@0x39
// as a u32 at field@0x30 of its argument struct. Reconstructed byte-exact; the
// gPlaySt low-bit read survives only as a both-branches-identical guard, and is
// taken as a full byte (`& 1`) rather than the `unk_2B_00:1` bitfield extraction.

struct PlayStByteView
{
    u8 _pad[0x2B];
    u8 byte2B;
};

struct Sub80A3228Arg
{
    u8  _pad00[0x30];
    /* 30 */ u32 result;
    u8  _pad34[0x39 - 0x34];
    /* 39 */ u8 input;
};

void sub_80A3228(struct Sub80A3228Arg * arg)
{
    if (((struct PlayStByteView *)&gPlaySt)->byte2B & 1)
        arg->result = 0x7B7 - arg->input;
    else
        arg->result = 0x7B7 - arg->input;
}
