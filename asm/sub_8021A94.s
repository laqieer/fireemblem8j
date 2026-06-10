	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8021A94, "ax", %progbits
@ sub_8021A94 @ JP 0x08021A94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021A94
	.thumb_func
sub_8021A94:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r6, r3, #0x18
	asrs r6, r6, #0x18
	ldr r0, _08021AE0 @ =0x085C3950
	mov r1, r8
	bl sub_8002BCC
	adds r3, r0, #0
	adds r0, #0x64
	strh r6, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	str r3, [sp]
	bl BG_SetPosition
	ldr r3, [sp]
	adds r3, #0x66
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021AE0: .4byte 0x085C3950

