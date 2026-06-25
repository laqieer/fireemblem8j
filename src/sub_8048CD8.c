#include "global.h"

#include "hardware.h"
#include "sio.h"

// JP-only SIO link-arena menu state. Field offsets read from the gbadisasm
// oracle; named locally to avoid touching the shared sio.h struct.
struct SioMenuCursorState
{
    /* 44 */ STRUCT_PAD(0x00, 0x44);
    /* 44 */ int cursor;
    /* 48 */ STRUCT_PAD(0x48, 0x50);
    /* 50 */ int unk_50;
};

struct SioMenuCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x54);
    /* 54 */ struct SioMenuCursorState * state;
    /* 58 */ STRUCT_PAD(0x58, 0x60);
    /* 60 */ int unk_60;
};

// JP-only SIO link-arena option-availability table (EWRAM); placeholder name.
extern u8 gUnk_02000C04[];

void sub_8048CD8(struct SioMenuCursorProc * proc)
{
    struct SioMenuCursorState * st = proc->state;

    if (gKeyStatusPtr->newKeys & DPAD_UP)
    {
        if (st->cursor > 0)
        {
            st->cursor--;
            SioPlaySoundEffect(3);
        }
    }

    if (gKeyStatusPtr->newKeys & DPAD_DOWN)
    {
        if (st->cursor <= 1)
        {
            st->cursor++;
            SioPlaySoundEffect(3);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        u8 * options = gUnk_02000C04;
        options++;

        if (options[st->cursor] != 0)
        {
            SioPlaySoundEffect(2);
            st->unk_50 = 1;
            proc->unk_60 = st->cursor;
            Proc_Break(proc);
        }
        else
        {
            SioPlaySoundEffect(0);
        }
    }
}
