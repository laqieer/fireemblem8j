	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_802501C, 0x0802501C + 1
	.section .text.sub_802607C, "ax", %progbits
@ sub_802607C @ JP 0x0802607C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802607C
	.thumb_func
sub_802607C:
	push {lr}
	ldr r1, _08026098 @ =0x02033F38
	str r0, [r1]
	ldr r0, _0802609C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _080260A0 @ =sub_8026044
	bl sub_802501C
	pop {r0}
	bx r0
	.align 2, 0
_08026098: .4byte 0x02033F38
_0802609C: .4byte 0x0202E4E0
_080260A0: .4byte 0x08026045  @ sub_8026044

