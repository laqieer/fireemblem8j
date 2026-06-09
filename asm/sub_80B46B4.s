	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8089078, 0x08089078 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80B46B4, "ax", %progbits
@ sub_80B46B4 @ JP 0x080B46B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B46B4
	.thumb_func
sub_80B46B4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8089078
	adds r0, r4, #0
	bl sub_80B2874
	ldr r0, _080B46D0 @ =0x08A9E270
	bl Proc_EndEach
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B46D0: .4byte 0x08A9E270

