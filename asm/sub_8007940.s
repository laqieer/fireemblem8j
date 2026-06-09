	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8007940, "ax", %progbits
@ sub_8007940 @ JP 0x08007940 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007940
	.thumb_func
sub_8007940:
	push {lr}
	ldr r0, _08007950 @ =0x085B9148
	bl Proc_Find
	cmp r0, #0
	bne _08007954
	movs r0, #0
	b _08007956
	.align 2, 0
_08007950: .4byte 0x085B9148
_08007954:
	movs r0, #1
_08007956:
	pop {r1}
	bx r1
	.align 2, 0

