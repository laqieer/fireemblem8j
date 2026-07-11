#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "functions.h"

// JP-only augury/divination result-panel draw.
struct AuguryProc
{
    /* 00 */ STRUCT_PAD(0x00, 0x39);
    /* 39 */ u8 overallRank;
    /* 3A */ u8 unk3A;
    /* 3B */ u8 valid;
    /* 3C */ u8 index;
    /* 3D */ u8 unlocked;
    /* 3E */ STRUCT_PAD(0x3E, 0x40);
    /* 40 */ u8 turnsA;
    /* 41 */ u8 turnsB;
    /* 42 */ u8 turnsC;
    /* 43 */ STRUCT_PAD(0x43, 0x4E);
    /* 4E */ u8 winCount;
    /* 4F */ STRUCT_PAD(0x4F, 0x58);
    /* 58 */ int score;
};

extern void sub_80A34F0(int base, int row, int color, int id, int count);

extern const u32 gPrepItemTextMsgIds[5];
extern const u32 gUnknown_08A95524[];
extern const u32 gUnknown_08A9553C[];

void DrawAuguryResultPanel(struct AuguryProc * proc)
{
    char * string;
    u16 * base;
    register int offset asm("r6");
    register const u32 * p asm("r8");

    ResetText();

    do
    {
        base = (u16 *)0x02023CA8;
        BG_Fill(base, 0);
        SetTextFontGlyphs(0);
        SetTextFont(0);

        PutDrawText(0, base + 34, 0, 0, 12, (char *)gUnknown_08A9553C[proc->index]);

        if (proc->valid)
        {
            register u16 * tilemap asm("r4");
            register u8 * turnsA asm("r9");
            register u8 * unlocked asm("sl");
            u8 * rank;
            u8 * turnsB;
            u8 * turnsC;
            u8 * wins;
            int count;

            turnsA = &proc->turnsA;
            turnsB = &proc->turnsB;
            turnsC = &proc->turnsC;
            rank = &proc->overallRank;
            unlocked = &proc->unlocked;
            wins = turnsB + 13;

            offset = 0x100;
            p = gPrepItemTextMsgIds;
            count = 4;

            do
            {
                register const u32 * q asm("r3") = p;
                register u32 msg asm("r0");

                q++;
                p = q;
                q--;

                // Preserve the target's exact post-increment table walk.
                asm("ldmia %0!, {%1}" : "+r"(q), "=r"(msg));

                PutDrawText(
                    0,
                    (u16 *)((u8 *)(tilemap = (u16 *)0x02023CAC) + offset),
                    0,
                    0,
                    5,
                    GetStringFromIndex(msg));

                offset += 0x80;
                count--;
            } while (count >= 0);

            count = 5;
            string = GetStringFromIndex(1232);

            {
                register int tileOffset asm("r2") = 142;
                u16 * dst;

                asm("" : "+r"(tileOffset));
                dst = tilemap + tileOffset;
                offset = 4;
                PutDrawText(0, dst, 0, 0, offset, string);
            }

            PutNumber(tilemap + 152, 2, proc->score);
            PutSpecialChar(tilemap + 153, 3, 30);
            PutDrawText(0, tilemap + 206, 0, 0, offset, GetStringFromIndex(0x4D1));
            PutSpecialChar(tilemap + 212, 0, 32);
            PutSpecialChar(tilemap + 215, 0, 32);

            {
                u16 * dst = tilemap + 211;
                register u8 * tmp asm("r3") = turnsA;

                asm("" : "+r"(tmp));
                PutNumber(dst, 2, *tmp);
            }

            {
                register int tileOffset asm("r1") = 214;

                asm("" : "+r"(tileOffset));
                PutNumber2Digit(tilemap + tileOffset, 2, *turnsB);
            }

            PutNumber2Digit(tilemap + 217, 2, *turnsC);
            PutDrawText(0, tilemap + 39, 3, 0, count, GetStringFromIndex(0x4D2));
            PutSpecialChar(tilemap + 43, 4, gUnknown_08A95524[*rank]);

            {
                register u8 * tmp asm("r1") = unlocked;

                asm("" : "+r"(tmp));

                if (!*tmp)
                    PutDrawText(0, tilemap + 46, 3, 0, offset, GetStringFromIndex(0x4D3));
                else
                    PutDrawText(0, tilemap + 46, 3, 4, offset, GetStringFromIndex(0x4D4));
            }

            string = GetStringFromIndex(0x4D5);
            tilemap = (u16 *)0x02023D16;
            PutDrawText(0, tilemap, 3, 0, 2, string);

            {
                u16 * dst = tilemap + 2;
                register u8 * tmp asm("r3") = wins;

                asm("" : "+r"(tmp));
                PutNumber(dst, 2, *tmp);
            }

            string = GetStringFromIndex(0x4D6);
            tilemap += 3;
            PutDrawText(0, tilemap, 3, 0, 2, string);
        }
        else
        {
            int index;
            int byteOffset;
            register int row asm("r4");
            register u16 * tilemap asm("r6");
            register u8 * unlocked asm("sl");

            index = 0;
            unlocked = &proc->unlocked;
            byteOffset = 0x100;
            row = 4;

            for (; index <= 4; index++)
            {
                string = GetStringFromIndex(gPrepItemTextMsgIds[index]);
                tilemap = (u16 *)0x02023CAC;
                PutDrawText(0, (u16 *)(byteOffset + (int)tilemap), 1, 0, 5, string);
                sub_80A34F0(8, row, 1, 20, 3);
                byteOffset += 0x80;
                row += 2;
            }

            string = GetStringFromIndex(1232);

            {
                u16 * dst = tilemap + 142;

                row = 4;
                PutDrawText(0, dst, 1, 0, row, string);
            }

            sub_80A34F0(21, 7, 1, 20, 3);
            PutDrawText(0, tilemap + 206, 1, 0, row, GetStringFromIndex(0x4D1));
            sub_80A34F0(21, 9, 1, 20, 3);
            PutDrawText(0, tilemap + 39, 1, 0, 5, GetStringFromIndex(0x4D2));
            sub_80A34F0(13, 1, 1, 20, 1);

            {
                register u8 * tmp asm("r3") = unlocked;

                asm("" : "+r"(tmp));

                if (!*tmp)
                    PutDrawText(0, tilemap + 46, 1, 0, row, GetStringFromIndex(0x4D3));
                else
                    PutDrawText(0, tilemap + 46, 1, 4, row, GetStringFromIndex(0x4D4));
            }

            sub_80A34F0(23, 1, 1, 20, 4);
        }
    } while (0);

    BG_EnableSyncByMask(4);
}
