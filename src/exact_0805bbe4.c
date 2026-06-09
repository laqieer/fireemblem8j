#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

struct BanimUnkStructCommPriv
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x32);

    /* 32 */ s16 unk32;

    /* 34 */ STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x4C);

    /* 4C */ int unk4C;
};

struct ProcEkrUnitMainMini
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ void * unk_5C;
};

//! FE8U = 0x0805AE40
void SetBanimTerrainPos(struct BanimUnkStructComm * buf, s16 a, s16 b, s16 c, s16 d)
{
    struct BanimUnkStructCommPriv * priv;

    priv = buf->proc14;
    priv->unk32 = a;
    priv->unk3A = b;

    priv = buf->proc18;
    priv->unk32 = c;
    priv->unk3A = d;
}
