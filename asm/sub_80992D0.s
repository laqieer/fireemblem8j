	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80992D0, "ax", %progbits
@ sub_80992D0 @ JP 0x080992D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80992D0
	.thumb_func
sub_80992D0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080992E8 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _080992E0
	str r4, [r0, #0x5c]
_080992E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080992E8: .4byte 0x08A94430

