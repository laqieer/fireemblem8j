	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_804BB40, 0x0804BB40 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_804BBA8, "ax", %progbits
@ sub_804BBA8 @ JP 0x0804BBA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BBA8
	.thumb_func
sub_804BBA8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge _0804BBF2
_0804BBBE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _0804BC14 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804BBEA
	ldr r0, [r4]
	cmp r0, #0
	beq _0804BBEA
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl sub_804BB40
	adds r6, r6, r0
	adds r0, r4, #0
	bl sub_8018E64
	adds r6, r6, r0
_0804BBEA:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt _0804BBBE
_0804BBF2:
	ldr r0, _0804BC18 @ =0x0203DD8C
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804BC14: .4byte 0x00010004
_0804BC18: .4byte 0x0203DD8C

