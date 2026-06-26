typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;
typedef int s32;

/* JP GameRankSaveData bit layout, derived from the oracle's exact lsls/lsrs
   shift positions (differs from fe8u: a 3-bit pad sits between valid and the
   first rank field). 0x18 bytes. */
struct RankSrc
{
    /* 00 */ u32 valid : 1;
             u32 pad1 : 3;
             u32 rankA : 3;
             u32 rankB : 3;
             u32 rankC : 3;
             u32 rankD : 3;
             u32 rankE : 3;
             u32 padc : 3;
             u32 flag22 : 1;
             u32 unk3A : 9;
    /* 04 */ u32 pad32 : 7;
             u32 chmode : 25;
    /* 08 */ u32 unk08 : 17;
             u32 unk41 : 6;
             u32 unk42 : 6;
             u32 gold_a : 3;
    /* 0C */ char name[0xB];
    /* 17 */ u8 luckydog;
};

/* The r6 proc (augury/divination panel). Fields 0x34..0x58 are the unpacked
   rank record; 0x3c/0x3d are read as chapter_mode/difficulty inputs. */
struct AuguryProc
{
    u8 pad00[0x34];
    /* 34 */ u8 rankA;
    /* 35 */ u8 rankB;
    /* 36 */ u8 rankC;
    /* 37 */ u8 rankD;
    /* 38 */ u8 rankE;
    /* 39 */ u8 overall;
    /* 3A */ u8 unk3A;
    /* 3B */ u8 valid;
    /* 3C */ u8 unk3C;
    /* 3D */ u8 difficulty;
    /* 3E */ u8 flag3E;
    /* 3F */ u8 luckydog;
    /* 40 */ u8 chmode;
    /* 41 */ u8 unk41;
    /* 42 */ u8 unk42;
    /* 43 */ char name[0xB];
    /* 4E */ u8 unk4E;
    /* 4F */ u8 pad4F[9];
    /* 58 */ u32 gold;
};

struct CharacterData
{
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u8 number;
    /* 05 */ u8 defaultClass;
    /* 06 */ u16 portraitId;
    u8 rest[0x34 - 8];
};

extern struct CharacterData gCharacterData[];   /* JP 0x088582BC */

extern void sub_80D6370(void *dst, void *src, u32 mode);
extern int GetSavedRankData(void *buf, int chapter_mode, int difficulty);
extern int GetOverallRank(int a, int b, int c, int d, int e);
extern void strcpy(char *dst, char *src);
extern void sub_8031438(char *s);
extern void sub_8009FA8(int id);
extern int sub_80A40A0(int a, int b);
extern void sub_8013008(void *a, void *b);
extern void j_TmApplyTsa(void *a, void *b);
extern void sub_80A3528(struct AuguryProc *p);
extern void sub_80A33E0(struct AuguryProc *p);
extern void BG_EnableSyncByMask(int m);
extern void EndFaceById(int id);
extern void sub_8091544(void);
extern void sub_80063F8(int a, int b, int c, int d, int e);
extern void sub_8006710(int a, int b, int c);
extern void sub_80913FC(int a, int b, int c, int d, int e, int f, int g, int h);
extern void SetCgTextFlags(int f);

void sub_80A390C(struct AuguryProc *proc)
{
    struct RankSrc buf;
    int i;

    *(u16 *)&buf = 0;
    sub_80D6370(&buf, &buf, 0x0100000C);

    GetSavedRankData(&buf, proc->pad00[0x3c], proc->difficulty);

    proc->valid = buf.valid;
    if (proc->valid == 0)
    {
        for (i = 0; i < 5; i++)
            ((u8 *)proc)[0x34 + i] |= 0xff;
    }
    else
    {
        proc->rankA = buf.rankA;
        proc->rankB = buf.rankB;
        proc->rankC = buf.rankC;
        proc->rankD = buf.rankD;
        proc->rankE = buf.rankE;
        proc->flag3E = buf.flag22;
        proc->chmode = buf.chmode;
        proc->unk41 = buf.unk41;
        proc->unk42 = buf.unk42;
        proc->gold = (((u32 *)&buf)[2] >> 11) & 0xFFFFFF;
        proc->luckydog = buf.luckydog;

        proc->overall = GetOverallRank(proc->rankA, proc->rankB, proc->rankC, proc->rankD, proc->rankE);
        proc->unk4E = (((u16 *)&buf)[5] >> 5) & 0x3f;
        proc->unk3A = buf.unk3A;

        if (proc->flag3E != 0)
        {
            strcpy(proc->name, buf.name);
            sub_8031438(proc->name);
        }
        else
        {
            sub_8009FA8(0x1F1);
            sub_8031438(proc->name);
        }

        if (proc->luckydog != 0)
        {
            if (sub_80A40A0(proc->luckydog, proc->overall) == 0)
                proc->luckydog = 0;
        }
        if (proc->luckydog == 0)
        {
            if (proc->unk3C != 0)
                proc->luckydog = 0;
            else
                proc->luckydog = 0;
        }
    }

    sub_8013008((void *)0x08A9A8D4, (void *)0x02020188);
    j_TmApplyTsa((void *)0x020234A8, (void *)0x02020188);
    sub_80A3528(proc);
    sub_80A33E0(proc);
    BG_EnableSyncByMask(7);
    EndFaceById(0);
    sub_8091544();

    if (proc->valid != 0 && proc->luckydog != 0)
    {
        sub_80063F8(0, gCharacterData[proc->luckydog - 1].portraitId, 0xd8, 0x58, 0xc1 << 1);
        i = sub_80A40A0(proc->luckydog, proc->overall);
        sub_8006710(0x28, 0, 1);
        sub_80913FC(0x16, 0x13, 0x12, 4, i, 0x06011000, 0xa, 0);
        SetCgTextFlags(0x809FE);
    }
}