	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_806E940, 0x0806E940 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_8053668, "ax", %progbits
@ sub_8053668 @ JP 0x08053668 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053668
	.thumb_func
sub_8053668:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08053698 @ =0x02017728
	ldr r5, [r1]
	cmp r5, #0
	bne _080536D6
	movs r0, #1
	str r0, [r1]
	ldr r0, _0805369C @ =0x085E3844
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080536A4
	ldr r0, _080536A0 @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b _080536AC
	.align 2, 0
_08053698: .4byte 0x02017728
_0805369C: .4byte 0x085E3844
_080536A0: .4byte 0x02000000
_080536A4:
	ldr r0, _080536DC @ =0x02000000
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
_080536AC:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl sub_806E940
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl sub_8073F94
_080536D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080536DC: .4byte 0x02000000

