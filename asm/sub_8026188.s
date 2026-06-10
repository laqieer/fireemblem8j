	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_802501C, 0x0802501C + 1
	.section .text.sub_8026188, "ax", %progbits
@ sub_8026188 @ JP 0x08026188 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026188
	.thumb_func
sub_8026188:
	push {lr}
	ldr r1, _080261A4 @ =0x02033F38
	str r0, [r1]
	ldr r0, _080261A8 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _080261AC @ =sub_80260A4
	bl sub_802501C
	pop {r0}
	bx r0
	.align 2, 0
_080261A4: .4byte 0x02033F38
_080261A8: .4byte 0x0202E4E0
_080261AC: .4byte 0x080260A5  @ sub_80260A4

