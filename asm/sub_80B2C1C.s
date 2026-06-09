	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013608, 0x08013608 + 1
	.section .text.sub_80B2C1C, "ax", %progbits
@ sub_80B2C1C @ JP 0x080B2C1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2C1C
	.thumb_func
sub_80B2C1C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B2C40
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080B2C42
_080B2C40:
	lsls r2, r1, #1
_080B2C42:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013608
	ldr r2, _080B2C78 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080B2C72
	adds r0, r4, #0
	bl sub_8002DE4
_080B2C72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C78: .4byte 0x03003020

