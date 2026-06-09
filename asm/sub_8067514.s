	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8067514, "ax", %progbits
@ sub_8067514 @ JP 0x08067514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067514
	.thumb_func
sub_8067514:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x20]
	ldr r1, _08067574 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067578 @ =0x08601B48
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	ldr r0, _0806757C @ =0x08601B30
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	mov r1, r8
	strh r1, [r0, #2]
	mov r1, sb
	strh r1, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _08067580 @ =0x0000F3FF
	ands r1, r2
	orrs r1, r7
	strh r1, [r0, #8]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067574: .4byte 0x0201774C
_08067578: .4byte 0x08601B48
_0806757C: .4byte 0x08601B30
_08067580: .4byte 0x0000F3FF

