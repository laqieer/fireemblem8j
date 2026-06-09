	.syntax unified
	.section .text.IsPositionMagicSealed, "ax", %progbits
@ IsPositionMagicSealed @ JP 0x080189AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsPositionMagicSealed
	.thumb_func
IsPositionMagicSealed:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0x81
	ldr r6, _080189FC @ =0x085C2A50
_080189B6:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018A0C
	ldr r1, [r2]
	cmp r1, #0
	beq _08018A0C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08018A0C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	subs r1, r0, r5
	cmp r1, #0
	bge _080189E8
	subs r1, r5, r0
_080189E8:
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	subs r0, r2, r4
	cmp r0, #0
	blt _08018A00
	adds r0, r1, r0
	cmp r0, #0xa
	ble _08018A08
	b _08018A0C
	.align 2, 0
_080189FC: .4byte 0x085C2A50
_08018A00:
	subs r0, r4, r2
	adds r0, r1, r0
	cmp r0, #0xa
	bgt _08018A0C
_08018A08:
	movs r0, #1
	b _08018A14
_08018A0C:
	adds r3, #1
	cmp r3, #0xbf
	ble _080189B6
	movs r0, #0
_08018A14:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

