#include "global.h"
#include <stdarg.h>
#include <stdio.h>
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

int GetStringTextCenteredPos(int x, const char *str)
{
    return (x - GetStringTextLen(str)) / 2;
}
