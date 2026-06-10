	.syntax unified
	.set GetCurrentPromotedLevelBonus, 0x08037BDC + 1
	.set sub_8017CE4, 0x08017CE4 + 1
	.section .text.sub_8017E3C, "ax", %progbits
@ sub_8017E3C @ JP 0x08017E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017E3C
	.thumb_func
sub_8017E3C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r2, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017E64
	ldrb r4, [r2, #5]
	bl GetCurrentPromotedLevelBonus
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8017CE4
_08017E64:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	movs r2, #8
	ldrsb r2, [r5, r2]
	subs r2, #1
	adds r0, r5, #0
	bl sub_8017CE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

