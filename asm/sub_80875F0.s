	.syntax unified
	.set sub_80088FC, 0x080088FC + 1
	.section .text.sub_80875F0, "ax", %progbits
@ sub_80875F0 @ JP 0x080875F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80875F0
	.thumb_func
sub_80875F0:
	push {lr}
	bl sub_80088FC
	movs r1, #0
	cmp r0, #1
	bne _080875FE
	movs r1, #1
_080875FE:
	adds r0, r1, #0
	pop {r1}
	bx r1

