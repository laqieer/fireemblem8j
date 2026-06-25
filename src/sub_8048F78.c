#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"

void sub_8048F78(struct Text * th)
{
    Text_InsertDrawString(th, 0, 0, GetStringFromIndex(0x66));
    Text_InsertDrawString(th, 0x80, 0, GetStringFromIndex(0x7BB));
    Text_InsertDrawString(th, 0xB0, 0, GetStringFromIndex(0x7BC));
}
