	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806EFB8, "ax", %progbits
@ sub_806EFB8 @ JP 0x0806EFB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EFB8
	.thumb_func
sub_806EFB8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0806EFE0 @ =0x0860352C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _0806EFEC
	ldr r2, _0806EFE4 @ =0x08617730
	ldr r3, _0806EFE8 @ =0x086189D0
	b _0806EFF0
	.align 2, 0
_0806EFE0: .4byte 0x0860352C
_0806EFE4: .4byte 0x08617730
_0806EFE8: .4byte 0x086189D0
_0806EFEC:
	ldr r2, _0806F01C @ =0x08619CA0
	ldr r3, _0806F020 @ =0x0861AF70
_0806EFF0:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldrh r0, [r4, #8]
	movs r1, #0xc0
	lsls r1, r1, #4
	ands r1, r0
	movs r5, #0
	strh r1, [r4, #8]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F024
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0806F02A
	.align 2, 0
_0806F01C: .4byte 0x08619CA0
_0806F020: .4byte 0x0861AF70
_0806F024:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0806F02A:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

