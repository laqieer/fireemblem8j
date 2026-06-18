	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C8D4, "ax", %progbits
@ NewEfxCircleWIN @ JP 0x0805C8D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxCircleWIN
	.thumb_func
NewEfxCircleWIN:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, _0805C92C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C930 @ =0x085FF270
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, sb
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetAnimAnotherSide
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C92C: .4byte 0x0201774C
_0805C930: .4byte 0x085FF270

