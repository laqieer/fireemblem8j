#include "global.h"
#include "proc.h"
int GetTalkChoiceResult(void);
void sub_80A4608(ProcPtr p) { if (GetTalkChoiceResult() == 1) Proc_Goto(p, 0); else Proc_Goto(p, 1); }
