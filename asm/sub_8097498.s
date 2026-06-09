	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8097498, "ax", %progbits
@ sub_8097498 @ JP 0x08097498 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097498
	.thumb_func
sub_8097498:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

