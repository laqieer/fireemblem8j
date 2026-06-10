	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F20, 0x08024F20 + 1
	.section .text.sub_80255C0, "ax", %progbits
@ sub_80255C0 @ JP 0x080255C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80255C0
	.thumb_func
sub_80255C0:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080255E8 @ =0x02033F38
	str r0, [r1]
	ldr r0, _080255EC @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _080255F0 @ =sub_8025578
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024F20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080255E8: .4byte 0x02033F38
_080255EC: .4byte 0x0202E4E0
_080255F0: .4byte 0x08025579  @ sub_8025578

