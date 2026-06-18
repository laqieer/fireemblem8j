	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_807D324, 0x0807D324 + 1
	.set sub_807D3BC, 0x0807D3BC + 1
	.section .text.sub_807D544, "ax", %progbits
@ SelSumPosAndMoveCamera @ JP 0x0807D544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SelSumPosAndMoveCamera
	.thumb_func
SelSumPosAndMoveCamera:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	lsls r2, r2, #0x18
	asrs r5, r2, #0x18
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	bl sub_807D324
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D5AA
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_807D3BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0807D582
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _0807D596
_0807D582:
	adds r1, r4, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r1, r7, #0
	bl Proc_Goto
	b _0807D5AA
_0807D596:
	mov r0, sp
	movs r1, #0
	ldrsb r1, [r0, r1]
	str r1, [r4, #0x3c]
	movs r2, #1
	ldrsb r2, [r0, r2]
	str r2, [r4, #0x40]
	adds r0, r4, #0
	bl sub_8015E18
_0807D5AA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

