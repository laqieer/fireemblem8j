	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80096C0, "ax", %progbits
@ sub_80096C0 @ JP 0x080096C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80096C0
	.thumb_func
sub_80096C0:
	push {lr}
	ldr r0, _080096D4 @ =0x085B9424
	bl Proc_Find
	cmp r0, #0
	beq _080096CE
	movs r0, #1
_080096CE:
	pop {r1}
	bx r1
	.align 2, 0
_080096D4: .4byte 0x085B9424

