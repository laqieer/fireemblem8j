	.syntax unified
	.set sub_807C3A0, 0x0807C3A0 + 1
	.section .text.sub_807C40C, "ax", %progbits
@ sub_807C40C @ JP 0x0807C40C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C40C
	.thumb_func
sub_807C40C:
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r6, #0x3f
	ands r1, r6
	movs r5, #0x40
	rsbs r5, r5, #0
	ldr r4, [sp]
	ands r4, r5
	orrs r4, r1
	ands r2, r6
	lsls r2, r2, #6
	ldr r1, _0807C448 @ =0xFFFFF03F
	ands r4, r1
	orrs r4, r2
	str r4, [sp]
	mov r1, sp
	movs r2, #1
	bl sub_807C3A0
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C448: .4byte 0xFFFFF03F

