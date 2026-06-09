	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.section .text.sub_8078CC0, "ax", %progbits
@ sub_8078CC0 @ JP 0x08078CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078CC0
	.thumb_func
sub_8078CC0:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08078CDE
	ldr r0, _08078D14 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80195E4
	bl sub_8019914
_08078CDE:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl sub_8012E84
	bl sub_8073B80
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08078D0C
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_08078D0C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D14: .4byte 0x0202BCEC

