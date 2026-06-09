	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80CB390, "ax", %progbits
@ sub_80CB390 @ JP 0x080CB390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB390
	.thumb_func
sub_80CB390:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CB3A4 @ =0x08B3F024
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080CB3A4: .4byte 0x08B3F024

