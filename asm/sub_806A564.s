	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806A564, "ax", %progbits
@ sub_806A564 @ JP 0x0806A564 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A564
	.thumb_func
sub_806A564:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x14
	mov r8, r0
	mov sb, r1
	lsls r6, r2, #0x18
	lsrs r6, r6, #0x18
	add r1, sp, #4
	ldr r0, _0806A5F4 @ =0x080E3F2C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, r8
	bl GetAnimPosition
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0806A5F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A5FC @ =0x086028A0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	mov r0, r8
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	mov r0, sb
	strh r0, [r5, #0x2e]
	lsls r4, r4, #2
	lsls r6, r6, #3
	adds r4, r4, r6
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	ldr r0, _0806A600 @ =0x0872C914
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806A604 @ =0x0872C1C4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A5F4: .4byte 0x080E3F2C
_0806A5F8: .4byte 0x0201774C
_0806A5FC: .4byte 0x086028A0
_0806A600: .4byte 0x0872C914
_0806A604: .4byte 0x0872C1C4

