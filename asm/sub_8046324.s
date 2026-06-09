	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043084, 0x08043084 + 1
	.section .text.sub_8046324, "ax", %progbits
@ sub_8046324 @ JP 0x08046324 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046324
	.thumb_func
sub_8046324:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _080463C8
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _080463A0 @ =0x0203DA20
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _080463A4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046378
	movs r0, #0x7d
	bl m4aSongNumStart
_08046378:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080463C8
	adds r1, r6, #0
	adds r1, #0x3b
	ldrb r2, [r1]
	ldr r0, _080463A8 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r2, r0
	beq _080463B0
	ldr r1, _080463AC @ =0x000006DB
	adds r0, r2, r1
	movs r1, #1
	bl sub_8043084
	b _080463B8
	.align 2, 0
_080463A0: .4byte 0x0203DA20
_080463A4: .4byte 0x0202BCEC
_080463A8: .4byte 0x085D31E8
_080463AC: .4byte 0x000006DB
_080463B0:
	ldr r0, _080463D0 @ =0x000006DA
	movs r1, #1
	bl sub_8043084
_080463B8:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _080463D4 @ =0x0203DD8C
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_080463C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080463D0: .4byte 0x000006DA
_080463D4: .4byte 0x0203DD8C

