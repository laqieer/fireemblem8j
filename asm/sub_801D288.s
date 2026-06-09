	.syntax unified
	.set UnitApplyWorkingMovementScript, 0x0801A508 + 1
	.set sub_8032BB0, 0x08032BB0 + 1
	.set sub_807AB24, 0x0807AB24 + 1
	.section .text.sub_801D288, "ax", %progbits
@ sub_801D288 @ JP 0x0801D288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D288
	.thumb_func
sub_801D288:
	push {lr}
	bl sub_8032BB0
	ldr r0, _0801D2A8 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl UnitApplyWorkingMovementScript
	ldr r0, _0801D2AC @ =0x02033EF8
	bl sub_807AB24
	pop {r0}
	bx r0
	.align 2, 0
_0801D2A8: .4byte 0x03004DF0
_0801D2AC: .4byte 0x02033EF8

