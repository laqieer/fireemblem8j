	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80922A4, "ax", %progbits
@ sub_80922A4 @ JP 0x080922A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80922A4
	.thumb_func
sub_80922A4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080922C4 @ =0x08A73F1C
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
_080922C4: .4byte 0x08A73F1C

