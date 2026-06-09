	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.sub_801D20C, "ax", %progbits
@ sub_801D20C @ JP 0x0801D20C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D20C
	.thumb_func
sub_801D20C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801D270 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D26A
	ldr r0, _0801D274 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801D26A
	ldr r0, _0801D278 @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801D280
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	adds r2, r0, #0
	ldr r1, _0801D27C @ =0x0202BE44
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _0801D260
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq _0801D280
_0801D260:
	cmp r2, #0
	beq _0801D280
	ldrb r0, [r2, #2]
	cmp r0, #1
	bne _0801D280
_0801D26A:
	movs r0, #0
	b _0801D282
	.align 2, 0
_0801D270: .4byte 0x0202E4D4
_0801D274: .4byte 0x0202E4DC
_0801D278: .4byte 0x03004DF0
_0801D27C: .4byte 0x0202BE44
_0801D280:
	movs r0, #1
_0801D282:
	pop {r4, r5}
	pop {r1}
	bx r1

