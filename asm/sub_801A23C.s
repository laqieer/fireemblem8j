	.syntax unified
	.section .text.sub_801A23C, "ax", %progbits
@ sub_801A23C @ JP 0x0801A23C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A23C
	.thumb_func
sub_801A23C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	mov ip, r2
	ldr r5, _0801A2F0 @ =0x03004E00
	ldr r2, [r5]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r6, r6, r0
	movs r0, #1
	ldrsb r0, [r2, r0]
	add ip, r0
	ldr r1, _0801A2F4 @ =0x03004B50
	ldr r0, _0801A2F8 @ =0x0202E4D8
	ldr r0, [r0]
	mov r3, ip
	lsls r7, r3, #2
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r3, r3, r1
	ldrb r0, [r2, #1]
	ldr r4, _0801A2FC @ =0x03004940
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r2]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r3, [r3]
	adds r2, r0, r3
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r2, r0
	bge _0801A2E4
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0801A2B6
	ldr r0, _0801A300 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq _0801A2B6
	ldrb r0, [r5, #0xa]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801A2E4
_0801A2B6:
	ldrb r0, [r5, #9]
	cmp r2, r0
	bgt _0801A2E4
	ldr r0, [r5, #4]
	strb r6, [r0]
	ldr r0, [r5, #4]
	mov r1, ip
	strb r1, [r0, #1]
	ldr r0, [r5, #4]
	mov r3, r8
	strb r3, [r0, #2]
	ldr r0, [r5, #4]
	strb r2, [r0, #3]
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, [r4]
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
_0801A2E4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A2F0: .4byte 0x03004E00
_0801A2F4: .4byte 0x03004B50
_0801A2F8: .4byte 0x0202E4D8
_0801A2FC: .4byte 0x03004940
_0801A300: .4byte 0x0202E4D4

