	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.section .text.sub_8041504, "ax", %progbits
@ sub_8041504 @ JP 0x08041504 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041504
	.thumb_func
sub_8041504:
	push {lr}
	sub sp, #0xc
	ldr r1, _0804152C @ =0x0203AA00
	adds r0, r1, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, #0x88
	ldrb r1, [r1]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_0804152C: .4byte 0x0203AA00

