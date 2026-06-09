	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024FE8, 0x08024FE8 + 1
	.section .text.sub_802626C, "ax", %progbits
@ sub_802626C @ JP 0x0802626C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802626C
	.thumb_func
sub_802626C:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08026294 @ =0x02033F38
	str r0, [r1]
	ldr r0, _08026298 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _0802629C @ =sub_8025744
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024FE8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026294: .4byte 0x02033F38
_08026298: .4byte 0x0202E4E0
_0802629C: .4byte 0x08025745  @ sub_8025744

