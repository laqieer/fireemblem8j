#include "global.h"

struct DivinationScreenProc
{
    PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x30);
    /* 30 */ int unk30;
};

#include "hardware.h"

#define gLCDBytes ((u8 *)&gLCDControlBuffer)

extern void ResetFaces(void);
extern void ResetText(void);
extern void InitText(void * a, int b);
extern const struct ROMChapterData * GetROMChapterStruct(unsigned chIndex);
extern void SetFlag(int);
extern bool CheckFlag(int);
extern void ClearFlag(int);

extern int GetChapterDivinationPortrait(struct DivinationScreenProc * proc);
extern u16 * BG_GetMapBuffer(int a);
extern void ResetIconGraphics_(void);
extern void LoadLegacyUiFrameGraphics(void);
extern void LoadObjUIGfx(void);
extern void LoadIconPalettes(int a);
extern void RestartMuralBackground(void);
extern void StartGreenText(int a);
extern void StartSysBrownBox(int a, int b, int c, int d, int e, int f);
extern void EnableSysBrownBox(int a, int b, int c, int d);
extern void sub_80A4188(int a, int b);
extern void LoadPrepBannerGfx(int a, int b);
extern void StartParallelWorker(void * func, struct DivinationScreenProc * proc);
extern void InitTalk(int a, int b, int c);
extern void StartTalkFace(int a, int b, int c, int d, int e);
extern void sub_80A4148(struct DivinationScreenProc * proc);

void sub_80A421C(struct DivinationScreenProc * proc)
{
    int r6;

    proc;
    r6 = GetChapterDivinationPortrait(proc);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    BG_Fill((void *)BG_GetMapBuffer(0), 0);
    BG_Fill((void *)BG_GetMapBuffer(1), 0);
    BG_Fill((void *)BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();
    ResetText();
    ResetIconGraphics_();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();

    BG_SetPosition(0, 4, 0xFFFC);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    LoadIconPalettes(4);
    RestartMuralBackground();
    BG_EnableSyncByMask(7);
    StartGreenText((int)proc);

    InitText((void *)0x02013580, 8);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0, (int)proc);
    EnableSysBrownBox(0, 0x90, 0x10, 0);
    sub_80A4188(0x7000, 1);

    proc->unk30 = *(u8 *)((char *)GetROMChapterStruct(gPlaySt.chapterIndex) + 0x80);

    LoadPrepBannerGfx(0x7800, 2);
    StartParallelWorker((void *)sub_80A4148, proc);
    InitTalk(0x200, 3, 1);

    if (gPlaySt.chapterIndex == 0x7d)
    {
        Proc_Goto(proc, 3);
    }
    else if (r6 == 0xae)
    {
        SetFlag(0x85);
    }
    else if (CheckFlag(0x85) && gPlaySt.chapterIndex <= 0x79)
    {
        r6 = 0xae;
        ClearFlag(0x85);
        Proc_Goto(proc, 4);
    }

    StartTalkFace(r6, 0xd4, 0x52, 0x202, 0);
}
