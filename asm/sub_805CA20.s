	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8054364, 0x08054364 + 1
	.section .text.sub_805CA20, "ax", %progbits
@ sub_805CA20 @ JP 0x0805CA20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CA20
	.thumb_func
sub_805CA20:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, _0805CA5C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CA60 @ =0x085FF288
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_8054364
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA5C: .4byte 0x0201774C
_0805CA60: .4byte 0x085FF288

