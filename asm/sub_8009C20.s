	.syntax unified
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.section .text.sub_8009C20, "ax", %progbits
@ sub_8009C20 @ JP 0x08009C20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009C20
	.thumb_func
sub_8009C20:
	push {lr}
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r0, _08009C3C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r2, [r0]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009C3C: .4byte 0x0202BCEC

