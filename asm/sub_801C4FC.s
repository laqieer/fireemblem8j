	.syntax unified
	.set WriteSuspendSave, 0x080AA460 + 1
	.section .text.sub_801C4FC, "ax", %progbits
@ sub_801C4FC @ JP 0x0801C4FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C4FC
	.thumb_func
sub_801C4FC:
	push {lr}
	ldr r1, _0801C510 @ =0x0203A954
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_0801C510: .4byte 0x0203A954

