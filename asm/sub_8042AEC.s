	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042678, 0x08042678 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8042AEC, "ax", %progbits
@ sub_8042AEC @ JP 0x08042AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042AEC
	.thumb_func
sub_8042AEC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _08042AFA
	bl sub_80D65C0
_08042AFA:
	ldr r5, _08042B58 @ =0x085D31E8
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne _08042B50
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq _08042B2E
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08042B2E:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl sub_8042678
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _08042B50
	adds r0, r4, #0
	bl sub_8002DE4
_08042B50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042B58: .4byte 0x085D31E8

