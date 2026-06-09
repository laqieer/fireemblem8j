	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6390, 0x080D6390 + 1
	.section .text.sub_8055F40, "ax", %progbits
@ sub_8055F40 @ JP 0x08055F40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055F40
	.thumb_func
sub_8055F40:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08055F72
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08055F78 @ =0x080DFD46
	str r0, [r4, #0x48]
	ldr r0, _08055F7C @ =0x085E3CD4
	str r0, [r4, #0x4c]
	ldr r0, _08055F80 @ =0x0878F150
	ldr r1, _08055F84 @ =0x06008000
	bl sub_80D6390
	ldr r0, _08055F88 @ =0x08794944
	ldr r1, _08055F8C @ =0x02022968
	movs r2, #8
	bl sub_80D636C
	adds r0, r4, #0
	bl sub_8002DE4
_08055F72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055F78: .4byte 0x080DFD46
_08055F7C: .4byte 0x085E3CD4
_08055F80: .4byte 0x0878F150
_08055F84: .4byte 0x06008000
_08055F88: .4byte 0x08794944
_08055F8C: .4byte 0x02022968

