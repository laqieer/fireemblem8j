	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set EkrDemonkingObj_SetBgOffset, 0x0807A1D8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8071FD8, 0x08071FD8 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8078960, "ax", %progbits
@ sub_8078960 @ JP 0x08078960 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078960
	.thumb_func
sub_8078960:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8071FD8
	adds r6, r0, #0
	ldr r0, _080789AC @ =0x0884887C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r1, #0
	strh r1, [r4, #0x2c]
	ldr r0, _080789B0 @ =0x03004F98
	str r1, [r0]
	ldr r0, _080789B4 @ =0x03004FA0
	str r1, [r0]
	movs r0, #0
	bl EkrDemonkingObj_SetBgOffset
	movs r0, #0xe0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080789AC: .4byte 0x0884887C
_080789B0: .4byte 0x03004F98
_080789B4: .4byte 0x03004FA0

