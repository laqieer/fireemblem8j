	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B95C8, "ax", %progbits
@ sub_80B95C8 @ JP 0x080B95C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B95C8
	.thumb_func
sub_80B95C8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B95D8 @ =0x00000836
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B95D8: .4byte 0x00000836

