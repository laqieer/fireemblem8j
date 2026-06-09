	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_809E100, "ax", %progbits
@ sub_809E100 @ JP 0x0809E100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809E100
	.thumb_func
sub_809E100:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809E120 @ =0x08A94D60
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E120: .4byte 0x08A94D60

