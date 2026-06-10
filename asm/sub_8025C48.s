	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F54, 0x08024F54 + 1
	.section .text.sub_8025C48, "ax", %progbits
@ sub_8025C48 @ JP 0x08025C48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025C48
	.thumb_func
sub_8025C48:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025C70 @ =0x02033F38
	str r0, [r1]
	ldr r0, _08025C74 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _08025C78 @ =sub_8025BD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024F54
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C70: .4byte 0x02033F38
_08025C74: .4byte 0x0202E4E0
_08025C78: .4byte 0x08025BD9  @ sub_8025BD8

