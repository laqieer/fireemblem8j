	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C1A4, "ax", %progbits
@ sub_805C1A4 @ JP 0x0805C1A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C1A4
	.thumb_func
sub_805C1A4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, _0805C1E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C1E4 @ =0x085FF1C8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
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
_0805C1E0: .4byte 0x0201774C
_0805C1E4: .4byte 0x085FF1C8

