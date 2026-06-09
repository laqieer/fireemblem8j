	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8089BAC, "ax", %progbits
@ sub_8089BAC @ JP 0x08089BAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089BAC
	.thumb_func
sub_8089BAC:
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0xc0
	ands r6, r0
	adds r4, r0, #0
_08089BBC:
	adds r4, r4, r7
	movs r0, #0x3f
	ands r4, r0
	adds r0, r6, r4
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08089BBC
	ldr r5, [r3]
	cmp r5, #0
	beq _08089BBC
	ldr r0, _08089C64 @ =0x0203E760
	ldrh r2, [r0, #2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08089BEA
	ldr r0, [r3, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089BEA:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08089BFC
	ldr r0, [r3, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089BFC:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08089C10
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089C10:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08089C22
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089C22:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08089C36
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089C36:
	movs r0, #0x20
	ands r0, r2
	ldr r2, [r3, #4]
	cmp r0, #0
	beq _08089C50
	ldr r0, [r5, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08089BBC
_08089C50:
	ldrb r0, [r2, #4]
	cmp r0, #0x62
	beq _08089BBC
	cmp r0, #0x34
	beq _08089BBC
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089C64: .4byte 0x0203E760

