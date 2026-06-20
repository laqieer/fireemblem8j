#include "global.h"
#include "fontgrp.h"
void sub_8049C94(void *p) { SetTextFont((struct Font *)0x02000C60); Text_InsertDrawString((struct Text *)0x02000C78, 0x80, 0, (const char *)*(int *)((char *)p + 0x54)); *(u16 *)((char *)p + 0x4c) = 0; }
