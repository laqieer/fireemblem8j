	.syntax unified
	.section .text.IsItemDanceRing, "ax", %progbits
@ IsItemDanceRing @ JP 0x08016C70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemDanceRing
	.thumb_func
IsItemDanceRing:
	push {lr}
	adds r1, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0x80
	bgt _08016C84
	cmp r1, #0x7c
	blt _08016C84
	movs r0, #1
	b _08016C86
_08016C84:
	movs r0, #0
_08016C86:
	pop {r1}
	bx r1
	.align 2, 0

