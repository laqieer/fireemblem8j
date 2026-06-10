	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_803C340, "ax", %progbits
@ sub_803C340 @ JP 0x0803C340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C340
	.thumb_func
sub_803C340:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _0803C3CC @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C3C0
_0803C354:
	ldr r0, _0803C3CC @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _0803C3BA
	lsls r5, r1, #2
_0803C366:
	ldr r0, _0803C3D0 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C3B4
	ldr r6, _0803C3D4 @ =0x0202E4D4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803C3B4
	ldr r0, _0803C3D8 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C3B4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	ldrb r1, [r0, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C3B4
	adds r7, #1
_0803C3B4:
	subs r4, #1
	cmp r4, #0
	bge _0803C366
_0803C3BA:
	mov r1, r8
	cmp r1, #0
	bge _0803C354
_0803C3C0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803C3CC: .4byte 0x0202E4D0
_0803C3D0: .4byte 0x0202E4E0
_0803C3D4: .4byte 0x0202E4D4
_0803C3D8: .4byte 0x0202BE40

