	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F20, 0x08024F20 + 1
	.set sub_80D65D8, 0x080D65D8 + 1
	.section .text.sub_8025280, "ax", %progbits
@ sub_8025280 @ JP 0x08025280 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025280
	.thumb_func
sub_8025280:
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _080252E8 @ =0x02033F38
	str r0, [r6]
	ldr r0, _080252EC @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r7, _080252F0 @ =sub_80251CC
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_8024F20
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080252E2
	bl GetSelectTargetCount
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl sub_80D65D8
	bl GetSelectTargetCount
	cmp r4, r0
	beq _080252E2
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_080252E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080252E8: .4byte 0x02033F38
_080252EC: .4byte 0x0202E4E0
_080252F0: .4byte 0x080251CD  @ sub_80251CC

