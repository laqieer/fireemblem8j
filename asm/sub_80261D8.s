	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_802501C, 0x0802501C + 1
	.section .text.sub_80261D8, "ax", %progbits
@ sub_80261D8 @ JP 0x080261D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80261D8
	.thumb_func
sub_80261D8:
	push {lr}
	ldr r1, _080261F4 @ =0x02033F38
	str r0, [r1]
	ldr r0, _080261F8 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _080261FC @ =sub_802613C
	bl sub_802501C
	pop {r0}
	bx r0
	.align 2, 0
_080261F4: .4byte 0x02033F38
_080261F8: .4byte 0x0202E4E0
_080261FC: .4byte 0x0802613D  @ sub_802613C

