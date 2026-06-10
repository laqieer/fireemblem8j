	.syntax unified
	.set sub_80A0DF8, 0x080A0DF8 + 1
	.section .text.sub_801DC64, "ax", %progbits
@ sub_801DC64 @ JP 0x0801DC64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DC64
	.thumb_func
sub_801DC64:
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_80A0DF8
	movs r0, #0
	pop {r1}
	bx r1

