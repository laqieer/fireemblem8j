	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B92A4, "ax", %progbits
@ sub_80B92A4 @ JP 0x080B92A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B92A4
	.thumb_func
sub_80B92A4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B92B4 @ =0x00000864
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B92B4: .4byte 0x00000864

