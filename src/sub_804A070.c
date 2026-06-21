#include "global.h"
#include "sio.h"

extern u8 data_080DEF7C[];
void sub_804A070(ProcPtr p) { StartLinkArenaPointsBox(); StartLinkArenaPointsNumberMovers(0x58, 0x3c, (const char *)data_080DEF7C, 0, p); }
