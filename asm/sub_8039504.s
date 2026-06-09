	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8038788, 0x08038788 + 1
	.section .text.sub_8039504, "ax", %progbits
@ sub_8039504 @ JP 0x08039504 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039504
	.thumb_func
sub_8039504:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803951C @ =0x02003B48
	movs r1, #8
	bl sub_8038788
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803951C: .4byte 0x02003B48

