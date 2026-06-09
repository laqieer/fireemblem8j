	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_806E210, "ax", %progbits
@ sub_806E210 @ JP 0x0806E210 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E210
	.thumb_func
sub_806E210:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806E244 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806E248 @ =0x086032B4
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E24C
	movs r0, #0x58
	b _0806E24E
	.align 2, 0
_0806E244: .4byte 0x0201774C
_0806E248: .4byte 0x086032B4
_0806E24C:
	movs r0, #0x98
_0806E24E:
	strh r0, [r5, #0x32]
	movs r0, #0x48
	strh r0, [r5, #0x3a]
	ldr r0, _0806E270 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806E27A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E274
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b _0806E278
	.align 2, 0
_0806E270: .4byte 0x0203E11C
_0806E274:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
_0806E278:
	strh r0, [r5, #0x32]
_0806E27A:
	ldr r2, _0806E368 @ =0x080DC15C
	mov sb, r2
	movs r0, #0x80
	add r0, sb
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1f
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1e
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r0, _0806E36C @ =0x086E24B4
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806E370 @ =0x086E2158
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E368: .4byte 0x080DC15C
_0806E36C: .4byte 0x086E24B4
_0806E370: .4byte 0x086E2158

