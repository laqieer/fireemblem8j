	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8045434, "ax", %progbits
@ sub_8045434 @ JP 0x08045434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045434
	.thumb_func
sub_8045434:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08045480 @ =0x085D35FC
	mov r1, r8
	bl sub_8002BCC
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, sb
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08045480: .4byte 0x085D35FC

