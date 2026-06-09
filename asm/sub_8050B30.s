	.syntax unified
	.set UnlockGame, 0x08015394 + 1
	.section .text.sub_8050B30, "ax", %progbits
@ sub_8050B30 @ JP 0x08050B30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050B30
	.thumb_func
sub_8050B30:
	push {lr}
	ldr r1, _08050B40 @ =0x0203E0F0
	movs r0, #0
	str r0, [r1]
	bl UnlockGame
	pop {r0}
	bx r0
	.align 2, 0
_08050B40: .4byte 0x0203E0F0

