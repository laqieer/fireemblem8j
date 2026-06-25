#include "global.h"
#include "proc.h"
#include "face.h"
#include "scene.h"

// JP-only augury (uranai) screen: draws one fortune-result text/CG page @ 0x080A3C64

struct AuguryTextProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ u16 msgIndex;
};

struct AuguryEntry
{
    /* 00 */ u8 pad00[6];
    /* 06 */ u16 msgid;
    /* 08 */ u8 pad08[0x34 - 0x08];
};

extern int sub_80A412C(int id);
extern int sub_80A40D4(int id);
extern void sub_8006710(int a, int b, int c);
extern void sub_80913FC(int a, int b, int c, int d, int e, void* f, int g, int h);
extern void SetCgTextFlags(int flags);
extern struct AuguryEntry gUnk_088582BC[];

void sub_80A3C64(struct AuguryTextProc* proc)
{
    int id;
    int r5;

    id = sub_80A412C(proc->msgIndex);
    if (id == 0)
    {
        proc->msgIndex = 0;
        id = sub_80A412C(0);
    }

    r5 = sub_80A40D4(proc->msgIndex);
    proc->msgIndex++;

    EndFaceById(0);

    StartTalkFace(gUnk_088582BC[id - 1].msgid, 0xD8, 0x58, 0x82, 0);
    sub_8006710(0x28, 0, 1);
    sub_80913FC(0x16, 0x13, 0x12, 4, r5, (void*)0x06011000 /* VRAM */, 0xA, 0);
    SetCgTextFlags(0x0002000A);
}
