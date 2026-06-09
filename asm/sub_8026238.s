	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F20, 0x08024F20 + 1
	.section .text.sub_8026238, "ax", %progbits
@ sub_8026238 @ JP 0x08026238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026238
	.thumb_func
sub_8026238:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08026260 @ =0x02033F38
	str r0, [r1]
	ldr r0, _08026264 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _08026268 @ =sub_8026200
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024F20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026260: .4byte 0x02033F38
_08026264: .4byte 0x0202E4E0
_08026268: .4byte 0x08026201  @ sub_8026200

