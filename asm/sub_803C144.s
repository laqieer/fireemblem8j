	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B674, 0x0801B674 + 1
	.section .text.sub_803C144, "ax", %progbits
@ sub_803C144 @ JP 0x0803C144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C144
	.thumb_func
sub_803C144:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _0803C1DC @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl sub_801B674
	ldr r0, _0803C1E0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C1CA
_0803C176:
	ldr r0, _0803C1E0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803C1C4
	lsls r5, r1, #2
_0803C186:
	ldr r0, _0803C1DC @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C1BE
	ldr r0, _0803C1E4 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803C1BE
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C1BE
	movs r0, #1
	add r8, r0
_0803C1BE:
	subs r4, #1
	cmp r4, #0
	bge _0803C186
_0803C1C4:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803C176
_0803C1CA:
	adds r0, r6, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C1DC: .4byte 0x0202E4DC
_0803C1E0: .4byte 0x0202E4D0
_0803C1E4: .4byte 0x0202E4D4

