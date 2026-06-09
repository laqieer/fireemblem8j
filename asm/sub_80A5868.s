	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80A5868, "ax", %progbits
@ sub_80A5868 @ JP 0x080A5868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5868
	.thumb_func
sub_80A5868:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A5880 @ =0x08A95B70
	bl Proc_Find
	cmp r0, #0
	beq _080A5878
	str r4, [r0, #0x3c]
_080A5878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5880: .4byte 0x08A95B70

