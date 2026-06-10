	.syntax unified
	.set sub_8025C48, 0x08025C48 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8024468, "ax", %progbits
@ sub_8024468 @ JP 0x08024468 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024468
	.thumb_func
sub_8024468:
	push {lr}
	ldr r0, _08024480 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025C48
	ldr r0, _08024484 @ =0x085C5818
	bl sub_80507B0
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08024480: .4byte 0x03004DF0
_08024484: .4byte 0x085C5818

