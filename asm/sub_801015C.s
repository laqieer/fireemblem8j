	.syntax unified
	.set LoadUnit_0, 0x0800F8D4 + 1
	.section .text.sub_801015C, "ax", %progbits
@ sub_801015C @ JP 0x0801015C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801015C
	.thumb_func
sub_801015C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	mov ip, r2
	ands r2, r0
	mov ip, r2
	movs r0, #2
	ldrsh r4, [r1, r0]
	ldrh r0, [r1, #4]
	movs r7, #4
	ldrsb r7, [r1, r7]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x18
	movs r0, #3
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08010188
	ldr r0, _08010260 @ =0x030004B0
	movs r1, #8
	ldrsh r4, [r0, r1]
_08010188:
	cmp r7, #0
	blt _08010190
	cmp r6, #0
	bge _0801019A
_08010190:
	ldr r0, _08010264 @ =0x030004DC
	movs r7, #0
	ldrsb r7, [r0, r7]
	movs r6, #2
	ldrsb r6, [r0, r6]
_0801019A:
	mov r0, sp
	movs r5, #0
	strb r4, [r0]
	mov r3, sp
	ldr r2, _08010268 @ =0x088582BC
	subs r1, r4, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r4, r0, r2
	ldrb r0, [r4, #5]
	strb r0, [r3, #1]
	mov r0, sp
	strb r5, [r0, #2]
	mov r1, sp
	ldrb r0, [r1, #3]
	movs r2, #2
	rsbs r2, r2, #0
	ands r2, r0
	strb r2, [r1, #3]
	movs r0, #0
	mov r1, ip
	cmp r1, #0xf
	beq _080101CA
	mov r0, ip
_080101CA:
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r3, sp
	ldrb r1, [r4, #0xb]
	lsls r1, r1, #3
	movs r2, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r2, sp
	movs r0, #0x3f
	ands r7, r0
	ldrb r1, [r2, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r7
	strb r0, [r2, #4]
	movs r0, #0x3f
	ands r6, r0
	lsls r2, r6, #6
	ldrh r1, [r3, #4]
	ldr r0, _0801026C @ =0xFFFFF03F
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
	mov r2, sp
	ldrb r1, [r2, #5]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #5]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r2, #5]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #5]
	mov r0, sp
	strb r5, [r0, #6]
	strb r5, [r0, #7]
	str r5, [sp, #8]
	strb r5, [r0, #0xc]
	strb r5, [r0, #0xd]
	strb r5, [r0, #0xe]
	strb r5, [r0, #0xf]
	strb r5, [r0, #0x10]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x13]
	movs r3, #0
	mov r2, ip
	cmp r2, #0xf
	bne _0801024C
	movs r3, #1
_0801024C:
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl LoadUnit_0
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010260: .4byte 0x030004B0
_08010264: .4byte 0x030004DC
_08010268: .4byte 0x088582BC
_0801026C: .4byte 0xFFFFF03F

