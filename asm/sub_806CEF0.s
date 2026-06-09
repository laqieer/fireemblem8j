	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_806CEF0, "ax", %progbits
@ sub_806CEF0 @ JP 0x0806CEF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806CEF0
	.thumb_func
sub_806CEF0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0806CF24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806CF28 @ =0x08602FB0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806CF2C
	movs r0, #0x58
	b _0806CF2E
	.align 2, 0
_0806CF24: .4byte 0x0201774C
_0806CF28: .4byte 0x08602FB0
_0806CF2C:
	movs r0, #0x98
_0806CF2E:
	strh r0, [r5, #0x32]
	movs r0, #0x48
	strh r0, [r5, #0x3a]
	ldr r0, _0806CF50 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806CF5A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806CF54
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b _0806CF58
	.align 2, 0
_0806CF50: .4byte 0x0203E11C
_0806CF54:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
_0806CF58:
	strh r0, [r5, #0x32]
_0806CF5A:
	ldrh r0, [r5, #0x32]
	subs r0, #0x10
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x3a]
	subs r0, #0x10
	strh r0, [r5, #0x3a]
	ldr r4, _0806D1F4 @ =0x086E254C
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806D1F8 @ =0x3E000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80564F0
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806D1FC @ =0x3C000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80564F0
	str r0, [r5, #0x68]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806D200 @ =0x3A000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80564F0
	str r0, [r5, #0x44]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806D204 @ =0x38000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80564F0
	str r0, [r5, #0x48]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806D208 @ =0x36000300
	str r1, [r0, #0x1c]
	ldr r2, _0806D20C @ =0x080DC15C
	mov r8, r2
	movs r0, #0x80
	add r0, r8
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1f
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1e
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1d
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1c
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1b
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r0, _0806D210 @ =0x086E24B4
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806D214 @ =0x086E2158
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D1F4: .4byte 0x086E254C
_0806D1F8: .4byte 0x3E000300
_0806D1FC: .4byte 0x3C000300
_0806D200: .4byte 0x3A000300
_0806D204: .4byte 0x38000300
_0806D208: .4byte 0x36000300
_0806D20C: .4byte 0x080DC15C
_0806D210: .4byte 0x086E24B4
_0806D214: .4byte 0x086E2158

