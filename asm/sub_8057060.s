	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8057060, "ax", %progbits
@ sub_8057060 @ JP 0x08057060 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057060
	.thumb_func
sub_8057060:
	push {lr}
	ldr r0, _08057074 @ =0x085E3D4C
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_08057074: .4byte 0x085E3D4C

