#include "global.h"
#include "proc.h"

void Proc_Goto(ProcPtr proc, int label)
{
    struct Proc* casted = (struct Proc*) proc;
    const struct ProcCmd* cmd;

    for (cmd = casted->proc_script; cmd->opcode != 0; cmd++)
    {
        if (cmd->opcode == 11 && cmd->dataImm == label)
        {
            casted->proc_scrCur = cmd;
            casted->proc_idleCb = NULL;

            return;
        }
    }
}

void Proc_GotoScript(ProcPtr proc, const struct ProcCmd* script)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_scrCur = script;
    casted->proc_idleCb = NULL;
}
