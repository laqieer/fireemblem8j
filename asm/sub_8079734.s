	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8079734, "ax", %progbits
@ sub_8079734 @ JP 0x08079734 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079734
	.thumb_func
sub_8079734:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r5, r0, #0
	ldr r0, _080797AC @ =0x0884CB34
	ldr r4, _080797B0 @ =0x02022968
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r0, _080797B4 @ =0x02000054
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl sub_80D636C
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl sub_80737A4
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl sub_80737A4
	bl sub_8001EE4
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080797A4
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_080797A4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080797AC: .4byte 0x0884CB34
_080797B0: .4byte 0x02022968
_080797B4: .4byte 0x02000054

