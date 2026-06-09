	.syntax unified
	.set SetStaffUseAction, 0x080294C4 + 1
	.section .text.sub_8029874, "ax", %progbits
@ sub_8029874 @ JP 0x08029874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029874
	.thumb_func
sub_8029874:
	push {lr}
	ldr r2, _0802988C @ =0x0203A954
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0
	bl SetStaffUseAction
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802988C: .4byte 0x0203A954

