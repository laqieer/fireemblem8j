	.syntax unified
	.set LoadRNState, 0x08000C0C + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_8043084, 0x08043084 + 1
	.section .text.SioBat_ReceiveFirstMover, "ax", %progbits
@ SioBat_ReceiveFirstMover @ JP 0x08046250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioBat_ReceiveFirstMover
	.thumb_func
SioBat_ReceiveFirstMover:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _0804628C @ =0x085D31E8
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _08046294
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08046314
	ldr r0, _08046290 @ =0x000006D9
	movs r1, #1
	bl sub_8043084
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl sub_8002DE4
	b _08046314
	.align 2, 0
_0804628C: .4byte 0x085D31E8
_08046290: .4byte 0x000006D9
_08046294:
	bl sub_8000CD8
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08046314
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046314
	ldr r4, _0804631C @ =0x0203DA20
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl LoadRNState
	ldr r0, _08046320 @ =0x000006D9
	movs r1, #1
	bl sub_8043084
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl sub_8002DE4
_08046314:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804631C: .4byte 0x0203DA20
_08046320: .4byte 0x000006D9

