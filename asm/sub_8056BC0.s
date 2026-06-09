	.syntax unified
	.set CheckBanimHensei, 0x08078730 + 1
	.set ExecBattleAnimArenaExit, 0x0805BE70 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8057060, 0x08057060 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_8078774, 0x08078774 + 1
	.section .text.sub_8056BC0, "ax", %progbits
@ sub_8056BC0 @ JP 0x08056BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056BC0
	.thumb_func
sub_8056BC0:
	push {lr}
	bl sub_805BDCC
	cmp r0, #1
	bne _08056BD0
	bl ExecBattleAnimArenaExit
	b _08056BE8
_08056BD0:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08056BDE
	bl sub_8078774
	b _08056BE8
_08056BDE:
	bl sub_8057060
	ldr r0, _08056BEC @ =sub_8056BF0
	bl SetMainUpdateRoutine
_08056BE8:
	pop {r0}
	bx r0
	.align 2, 0
_08056BEC: .4byte 0x08056BF1  @ sub_8056BF0

