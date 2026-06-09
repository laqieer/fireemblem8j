	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805AACC, 0x0805AACC + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_8072804, 0x08072804 + 1
	.set sub_80730E4, 0x080730E4 + 1
	.set sub_80857E8, 0x080857E8 + 1
	.section .text.sub_8050CD8, "ax", %progbits
@ sub_8050CD8 @ JP 0x08050CD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050CD8
	.thumb_func
sub_8050CD8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08050CFC @ =0x0201FB0C
	movs r0, #0
	str r0, [r1]
	ldr r0, _08050D00 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _08050D0E
	ldr r0, _08050D04 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08050D08
	movs r0, #0x20
	rsbs r0, r0, #0
	b _08050D0C
	.align 2, 0
_08050CFC: .4byte 0x0201FB0C
_08050D00: .4byte 0x02017744
_08050D04: .4byte 0x0203E11C
_08050D08:
	movs r0, #0xf0
	rsbs r0, r0, #0
_08050D0C:
	str r0, [r1]
_08050D0E:
	bl sub_805AACC
	bl sub_80730E4
	bl sub_8072804
	ldr r0, _08050D2C @ =0x02000024
	movs r1, #1
	str r1, [r0]
	bl sub_805BDCC
	cmp r0, #1
	bne _08050D30
	movs r0, #0
	b _08050D32
	.align 2, 0
_08050D2C: .4byte 0x02000024
_08050D30:
	movs r0, #0x1e
_08050D32:
	strh r0, [r4, #0x2c]
	ldr r0, _08050D48 @ =0x0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050D50
	ldr r1, _08050D4C @ =0x0203E18C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b _08050D56
	.align 2, 0
_08050D48: .4byte 0x0203E0FC
_08050D4C: .4byte 0x0203E18C
_08050D50:
	ldr r1, _08050D70 @ =0x0203E18C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
_08050D56:
	bl sub_80857E8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x54]
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050D70: .4byte 0x0203E18C

