	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806D570, "ax", %progbits
@ sub_806D570 @ JP 0x0806D570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D570
	.thumb_func
sub_806D570:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0806D5A0
	ldr r0, _0806D59C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
	b _0806D5DC
	.align 2, 0
_0806D59C: .4byte 0x0201774C
_0806D5A0:
	cmp r1, #0xf
	bgt _0806D5AA
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	b _0806D5BE
_0806D5AA:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r0, #0x2e
	ldrsh r2, [r4, r0]
	adds r0, r2, #0
	subs r0, #0x10
	movs r1, #0
	cmp r3, r0
	blt _0806D5BE
	subs r1, r2, r3
_0806D5BE:
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806D5DC
	asrs r0, r1, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D5D6
	ldr r1, [r4, #0x60]
	movs r0, #0xe0
	b _0806D5DA
_0806D5D6:
	ldr r1, [r4, #0x60]
	movs r0, #0x20
_0806D5DA:
	strh r0, [r1, #4]
_0806D5DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

