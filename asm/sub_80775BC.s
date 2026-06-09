	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80775BC, "ax", %progbits
@ sub_80775BC @ JP 0x080775BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80775BC
	.thumb_func
sub_80775BC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _080775F0 @ =0x087A9AF0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080775F0: .4byte 0x087A9AF0

