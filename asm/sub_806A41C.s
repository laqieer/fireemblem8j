	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806A41C, "ax", %progbits
@ sub_806A41C @ JP 0x0806A41C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A41C
	.thumb_func
sub_806A41C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	adds r5, r0, #0
	str r1, [sp, #0x5c]
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x88]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #0x60]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	add r1, sp, #4
	ldr r0, _0806A4C0 @ =0x080E3EC4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r0, sp, #0x34
	mov r8, r0
	ldr r1, _0806A4C4 @ =0x080E3EF4
	movs r2, #0x14
	bl memcpy
	add r6, sp, #0x48
	ldr r1, _0806A4C8 @ =0x080E3F08
	adds r0, r6, #0
	movs r2, #0x14
	bl memcpy
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, _0806A4CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A4D0 @ =0x08602888
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimAnotherSide
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	add r1, sp, #0x5c
	ldrh r1, [r1]
	strh r1, [r4, #0x2e]
	lsls r0, r7, #3
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r2, r0, #0
	str r2, [r4, #0x60]
	mov r3, sb
	cmp r3, #0
	beq _0806A4D4
	cmp r3, #1
	beq _0806A4EE
	b _0806A506
	.align 2, 0
_0806A4C0: .4byte 0x080E3EC4
_0806A4C4: .4byte 0x080E3EF4
_0806A4C8: .4byte 0x080E3F08
_0806A4CC: .4byte 0x0201774C
_0806A4D0: .4byte 0x08602888
_0806A4D4:
	lsls r1, r7, #2
	mov r4, r8
	adds r0, r4, r1
	ldrh r0, [r0]
	add r0, sl
	strh r0, [r2, #2]
	mov r0, sp
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x60]
	adds r0, r1, r0
	b _0806A504
_0806A4EE:
	lsls r1, r7, #2
	adds r0, r6, r1
	ldrh r0, [r0]
	add r0, sl
	strh r0, [r2, #2]
	mov r0, sp
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r3, [sp, #0x60]
	adds r0, r3, r0
_0806A504:
	strh r0, [r2, #4]
_0806A506:
	ldr r0, _0806A528 @ =0x0872BF7C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806A52C @ =0x0872B510
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A528: .4byte 0x0872BF7C
_0806A52C: .4byte 0x0872B510

