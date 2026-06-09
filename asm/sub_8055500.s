	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807282C, 0x0807282C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8055500, "ax", %progbits
@ sub_8055500 @ JP 0x08055500 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055500
	.thumb_func
sub_8055500:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08055562
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805553C
	ldr r0, _08055534 @ =0x0885727C
	ldr r1, _08055538 @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807282C
	b _0805554C
	.align 2, 0
_08055534: .4byte 0x0885727C
_08055538: .4byte 0x02022B88
_0805553C:
	ldr r0, _08055568 @ =0x0885727C
	ldr r1, _0805556C @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807282C
_0805554C:
	bl sub_8001EE4
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08055562
	adds r0, r4, #0
	bl sub_8002DE4
_08055562:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055568: .4byte 0x0885727C
_0805556C: .4byte 0x02022BC8

