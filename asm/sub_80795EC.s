	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80795EC, "ax", %progbits
@ sub_80795EC @ JP 0x080795EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80795EC
	.thumb_func
sub_80795EC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08079604 @ =0x08848A38
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x44]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079604: .4byte 0x08848A38

