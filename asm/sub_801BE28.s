	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_801BE28, "ax", %progbits
@ sub_801BE28 @ JP 0x0801BE28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BE28
	.thumb_func
sub_801BE28:
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	ldr r2, _0801BE64 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _0801BE68 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	pop {r1}
	bx r1
	.align 2, 0
_0801BE64: .4byte 0x03003020
_0801BE68: .4byte 0x020228A8

