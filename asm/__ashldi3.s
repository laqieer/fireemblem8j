	.syntax unified
	.section .text.__ashldi3, "ax", %progbits
@ __ashldi3 @ JP 0x080D6588 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __ashldi3
	.thumb_func
__ashldi3:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080D65B8
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080D65A4
	movs r3, #0
	rsbs r0, r0, #0
	adds r4, r5, #0
	lsls r4, r0
	b _080D65B4
_080D65A4:
	adds r1, r5, #0
	lsrs r1, r0
	adds r3, r5, #0
	lsls r3, r2
	adds r0, r6, #0
	lsls r0, r2
	adds r4, r0, #0
	orrs r4, r1
_080D65B4:
	adds r1, r4, #0
	adds r0, r3, #0
_080D65B8:
	pop {r4, r5, r6, pc}
	.align 2, 0

