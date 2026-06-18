	.syntax unified
	.section .text.sub_80599F8, "ax", %progbits
@ BattleAIS_ExecCommands @ JP 0x080599F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleAIS_ExecCommands
	.thumb_func
BattleAIS_ExecCommands:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0

