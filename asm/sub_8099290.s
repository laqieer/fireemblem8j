	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8099290, "ax", %progbits
@ sub_8099290 @ JP 0x08099290 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099290
	.thumb_func
sub_8099290:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080992B0 @ =0x08A94430
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8002BCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080992B0: .4byte 0x08A94430

