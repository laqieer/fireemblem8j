	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F88, 0x08024F88 + 1
	.section .text.sub_8025D94, "ax", %progbits
@ sub_8025D94 @ JP 0x08025D94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025D94
	.thumb_func
sub_8025D94:
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, _08025DC0 @ =0x02033F38
	str r0, [r1]
	ldr r0, _08025DC4 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	subs r4, #4
	ldr r2, _08025DC8 @ =sub_8025C7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8024F88
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025DC0: .4byte 0x02033F38
_08025DC4: .4byte 0x0202E4E0
_08025DC8: .4byte 0x08025C7D  @ sub_8025C7C

