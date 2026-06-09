	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80992EC, "ax", %progbits
@ sub_80992EC @ JP 0x080992EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80992EC
	.thumb_func
sub_80992EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099304 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _080992FC
	str r4, [r0, #0x60]
_080992FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099304: .4byte 0x08A94430

