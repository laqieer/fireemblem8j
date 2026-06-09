	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80CB3A8, "ax", %progbits
@ sub_80CB3A8 @ JP 0x080CB3A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB3A8
	.thumb_func
sub_80CB3A8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CB3BC @ =0x08B3F024
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080CB3BC: .4byte 0x08B3F024

