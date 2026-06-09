	.syntax unified
	.section .text.__lshrdi3, "ax", %progbits
@ __lshrdi3 @ JP 0x080DC088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __lshrdi3
	.thumb_func
__lshrdi3:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080DC0B8
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080DC0A4
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _080DC0B4
_080DC0A4:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_080DC0B4:
	adds r1, r4, #0
	adds r0, r3, #0
_080DC0B8:
	pop {r4, r5, r6, pc}
	.align 2, 0

