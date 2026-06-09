	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1800, "ax", %progbits
@ sub_80B1800 @ JP 0x080B1800 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1800
	.thumb_func
sub_80B1800:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1818 @ =0x08A9DAFC
	bl Proc_Find
	cmp r0, #0
	beq _080B1810
	str r4, [r0, #0x30]
_080B1810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1818: .4byte 0x08A9DAFC

