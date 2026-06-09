	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80943BC, "ax", %progbits
@ sub_80943BC @ JP 0x080943BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80943BC
	.thumb_func
sub_80943BC:
	push {lr}
	ldr r0, _080943D0 @ =0x08A934EC
	movs r1, #3
	bl sub_8002BCC
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080943D0: .4byte 0x08A934EC

