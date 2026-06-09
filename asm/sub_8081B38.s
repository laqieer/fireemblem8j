	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8081B38, "ax", %progbits
@ sub_8081B38 @ JP 0x08081B38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081B38
	.thumb_func
sub_8081B38:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _08081B74 @ =0x08A14704
	movs r1, #3
	bl sub_8002BCC
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	mov r1, r8
	strh r1, [r0, #0x30]
	strh r7, [r0, #0x3c]
	mov r2, sp
	ldrh r2, [r2, #0x1c]
	strh r2, [r0, #0x3e]
	adds r0, #0x40
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081B74: .4byte 0x08A14704

