	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.section .text.sub_804134C, "ax", %progbits
@ sub_804134C @ JP 0x0804134C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804134C
	.thumb_func
sub_804134C:
	push {lr}
	sub sp, #0xc
	ldr r2, _08041380 @ =0x0203AA00
	adds r0, r2, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x88
	ldrb r1, [r1]
	adds r3, r2, #0
	adds r3, #0x89
	ldrb r3, [r3]
	adds r2, #0x8a
	ldrb r2, [r2]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xb
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_08041380: .4byte 0x0203AA00

