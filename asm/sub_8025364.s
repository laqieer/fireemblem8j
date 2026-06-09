	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F20, 0x08024F20 + 1
	.section .text.sub_8025364, "ax", %progbits
@ sub_8025364 @ JP 0x08025364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025364
	.thumb_func
sub_8025364:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802538C @ =0x02033F38
	str r0, [r1]
	ldr r0, _08025390 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _08025394 @ =sub_80252F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024F20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802538C: .4byte 0x02033F38
_08025390: .4byte 0x0202E4E0
_08025394: .4byte 0x080252F5  @ sub_80252F4

