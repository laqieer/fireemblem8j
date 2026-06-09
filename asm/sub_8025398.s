	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8019174, 0x08019174 + 1
	.section .text.sub_8025398, "ax", %progbits
@ sub_8025398 @ JP 0x08025398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025398
	.thumb_func
sub_8025398:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _080253E4 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080253DC
	ldr r0, _080253E8 @ =0x02033F38
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _080253EC @ =0x0202E4D8
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_8019174
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080253DC
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_080253DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080253E4: .4byte 0x0202E4D4
_080253E8: .4byte 0x02033F38
_080253EC: .4byte 0x0202E4D8

