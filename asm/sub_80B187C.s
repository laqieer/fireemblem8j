	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B187C, "ax", %progbits
@ sub_80B187C @ JP 0x080B187C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B187C
	.thumb_func
sub_80B187C:
	push {lr}
	ldr r0, _080B188C @ =0x08A9DAFC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B188C: .4byte 0x08A9DAFC

