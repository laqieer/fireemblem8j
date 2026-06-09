	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80096B0, 0x080096B0 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.section .text.sub_80BEEB8, "ax", %progbits
@ sub_80BEEB8 @ JP 0x080BEEB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEEB8
	.thumb_func
sub_80BEEB8:
	push {lr}
	ldr r0, _080BEEE0 @ =0x08A9DD0C
	bl Proc_Find
	bl Proc_End
	ldr r0, _080BEEE4 @ =0x08AC1108
	bl Proc_Find
	bl Proc_End
	bl sub_8010F98
	bl sub_80096B0
	movs r0, #0
	bl sub_8001ACC
	pop {r0}
	bx r0
	.align 2, 0
_080BEEE0: .4byte 0x08A9DD0C
_080BEEE4: .4byte 0x08AC1108

