	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C3448, 0x080C3448 + 1
	.section .text.sub_80C3A44, "ax", %progbits
@ GMapPI_ShowLoop @ JP 0x080C3A44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GMapPI_ShowLoop
	.thumb_func
GMapPI_ShowLoop:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3A56
	cmp r0, #1
	beq _080C3A60
	b _080C3A6C
_080C3A56:
	ldr r1, _080C3A5C @ =0x08AC1E18
	b _080C3A62
	.align 2, 0
_080C3A5C: .4byte 0x08AC1E18
_080C3A60:
	ldr r1, _080C3AA0 @ =0x08AC1E1E
_080C3A62:
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r5, #3
_080C3A6C:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	bl sub_80C3448
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, r5
	bne _080C3A9A
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080C3A9A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3AA0: .4byte 0x08AC1E1E

