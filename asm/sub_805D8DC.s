	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805D8DC, "ax", %progbits
@ sub_805D8DC @ JP 0x0805D8DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805D8DC
	.thumb_func
sub_805D8DC:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D930 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D934 @ =0x085FF490
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, _0805D938 @ =0x087A8668
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, _0805D93C @ =0x087A4DA4
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805D940 @ =0x087A6508
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D930: .4byte 0x0201774C
_0805D934: .4byte 0x085FF490
_0805D938: .4byte 0x087A8668
_0805D93C: .4byte 0x087A4DA4
_0805D940: .4byte 0x087A6508

