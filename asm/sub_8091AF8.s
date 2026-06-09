	.syntax unified
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set SetFaceEyeControlById, 0x080063E0 + 1
	.section .text.sub_8091AF8, "ax", %progbits
@ sub_8091AF8 @ JP 0x08091AF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091AF8
	.thumb_func
sub_8091AF8:
	push {lr}
	subs r0, #0x16
	cmp r0, #9
	bhi _08091B80
	lsls r0, r0, #2
	ldr r1, _08091B0C @ =_08091B10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091B0C: .4byte _08091B10
_08091B10: @ jump table
	.4byte _08091B38 @ case 0
	.4byte _08091B3E @ case 1
	.4byte _08091B44 @ case 2
	.4byte _08091B4A @ case 3
	.4byte _08091B50 @ case 4
	.4byte _08091B56 @ case 5
	.4byte _08091B62 @ case 6
	.4byte _08091B68 @ case 7
	.4byte _08091B6E @ case 8
	.4byte _08091B74 @ case 9
_08091B38:
	movs r0, #0
	movs r1, #0
	b _08091B5A
_08091B3E:
	movs r0, #0
	movs r1, #1
	b _08091B5A
_08091B44:
	movs r0, #0
	movs r1, #3
	b _08091B5A
_08091B4A:
	movs r0, #0
	movs r1, #2
	b _08091B5A
_08091B50:
	movs r0, #0
	movs r1, #4
	b _08091B5A
_08091B56:
	movs r0, #0
	movs r1, #5
_08091B5A:
	bl SetFaceBlinkControlById
	movs r0, #1
	b _08091B82
_08091B62:
	movs r0, #0
	movs r1, #0
	b _08091B78
_08091B68:
	movs r0, #0
	movs r1, #2
	b _08091B78
_08091B6E:
	movs r0, #0
	movs r1, #3
	b _08091B78
_08091B74:
	movs r0, #0
	movs r1, #4
_08091B78:
	bl SetFaceEyeControlById
	movs r0, #1
	b _08091B82
_08091B80:
	movs r0, #0
_08091B82:
	pop {r1}
	bx r1
	.align 2, 0

