	.syntax unified
	.set FreeProcess, 0x08002CE4 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8002C60, "ax", %progbits
@ sub_8002C60 @ JP 0x08002C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002C60
	.thumb_func
sub_8002C60:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08002C6E
	bl sub_8002C60
_08002C6E:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08002C78
	bl sub_8002C60
_08002C78:
	adds r6, r4, #0
	adds r6, #0x27
	ldrb r0, [r6]
	movs r5, #1
	ands r5, r0
	cmp r5, #0
	bne _08002CB6
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _08002C92
	adds r0, r4, #0
	bl sub_80D65C0
_08002C92:
	adds r0, r4, #0
	bl FreeProcess
	str r5, [r4]
	str r5, [r4, #0xc]
	ldrb r0, [r6]
	movs r1, #1
	orrs r0, r1
	strb r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08002CB6
	ldr r1, [r4, #0x14]
	adds r1, #0x28
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_08002CB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

