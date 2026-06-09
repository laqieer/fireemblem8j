	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80992B4, "ax", %progbits
@ sub_80992B4 @ JP 0x080992B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80992B4
	.thumb_func
sub_80992B4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080992CC @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _080992C4
	str r4, [r0, #0x58]
_080992C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080992CC: .4byte 0x08A94430

